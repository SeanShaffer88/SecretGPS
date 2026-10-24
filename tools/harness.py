#!/usr/bin/env python3
"""SecretGPS startup-simulation harness.

Loads the addon files listed in a .toc (Retail or Camelot) against a
mocked WoW API using lupa, fires ADDON_LOADED -> PLAYER_LOGIN, then
drives the real UI: toggle open, select entries, tick a step, set a
waypoint, print diagnostics. Any Lua error fails the harness.

Mock notes:
- Plain frames deliberately have NO SetBackdrop; frames created with a
  template containing "BackdropTemplate" get it (Forever build fact).
- C_QuestLog.IsQuestFlaggedCompleted returns true only for quest 47826
  (Lucid Nightmare step 1) so flag-driven completion can be asserted.
- C_Map.SetUserWaypoint records the point so the driver can assert it.
"""
import pathlib
import sys

import lupa

ROOT = pathlib.Path(__file__).resolve().parent.parent
ADDON = ROOT / "SecretGPS"

PRELUDE = r"""
CHATLOG = {}
WAYPOINT = nil
local function newFS()
    local fs = { _text = "" }
    local methods = {
        GetText = function() return fs._text end,
        SetText = function(_, t) fs._text = tostring(t or "") end,
    }
    return setmetatable(fs, { __index = function(_, k)
        if methods[k] then return methods[k] end
        return function(...) return nil end
    end })
end
local function newTex()
    return setmetatable({}, { __index = function() return function(...) return nil end end })
end
FRAMES = {}
local function newFrame(kind, name, parent, template)
    local f = { _name = name or "", _kind = kind or "Frame", _scripts = {},
                _events = {}, _shown = true, _text = "" }
    local methods = {
        GetName = function() return f._name end,
        IsShown = function() return f._shown end,
        Show = function() f._shown = true end,
        Hide = function() f._shown = false end,
        SetText = function(_, t) f._text = tostring(t or "") end,
        GetText = function() return f._text end,
        SetScript = function(_, k, fn) f._scripts[k] = fn end,
        GetScript = function(_, k) return f._scripts[k] end,
        HookScript = function(_, k, fn) f._scripts[k] = fn end,
        RegisterEvent = function(_, e) f._events[e] = true end,
        UnregisterEvent = function(_, e) f._events[e] = nil end,
        CreateFontString = function() return newFS() end,
        CreateTexture = function() return newTex() end,
        StartMoving = function() end,
        StopMovingOrSizing = function() end,
        ClearFocus = function() end,
    }
    if template and tostring(template):find("BackdropTemplate") then
        methods.SetBackdrop = function() end
        methods.SetBackdropColor = function() end
        methods.SetBackdropBorderColor = function() end
    end
    local CAPGATED = { SetBackdrop = true, SetBackdropColor = true,
                       SetBackdropBorderColor = true }
    setmetatable(f, { __index = function(_, k)
        if methods[k] then return methods[k] end
        if CAPGATED[k] then return nil end
        return function(...) return newFrame("Frame") end
    end })
    FRAMES[#FRAMES + 1] = f
    if name then _G[name] = f end
    return f
end
CreateFrame = newFrame
UIParent = newFrame("Frame", "UIParent")
Minimap = newFrame("Frame", "Minimap")
DEFAULT_CHAT_FRAME = { AddMessage = function(_, msg) CHATLOG[#CHATLOG + 1] = tostring(msg) end }
SlashCmdList = {}
GetBuildInfo = function() return "12.1.5", "99999", "Oct 2026", 120105 end
C_QuestLog = { IsQuestFlaggedCompleted = function(id) return id == 47826 end }
C_Map = { SetUserWaypoint = function(p) WAYPOINT = p end }
C_SuperTrack = { SetSuperTrackedUserWaypoint = function() end }
UiMapPoint = { CreateFromCoordinates = function(mapID, x, y)
    return { mapID = mapID, x = x, y = y } end }
"""

DRIVER = r"""
local report = {}
local function note(s) report[#report + 1] = s end
local function try(label, fn)
    local ok, e = pcall(fn)
    note(label .. ": " .. (ok and "ok" or ("FAIL " .. tostring(e))))
    return ok
end
local NS = {}
for _, item in ipairs(FILES) do
    local fn, err = load(item.code, item.name)
    if not fn then note("LOADFAIL " .. item.name .. ": " .. tostring(err)); return table.concat(report, "\n") end
    local ok, e = pcall(fn, "SecretGPS", NS)
    if not ok then note("RUNFAIL " .. item.name .. ": " .. tostring(e)); return table.concat(report, "\n") end
end
note("loaded " .. #FILES .. " files, entries=" .. #NS.Entries)
local function fire(ev, ...)
    for _, f in ipairs(FRAMES) do
        if f._events and f._events[ev] and f._scripts and f._scripts.OnEvent then
            local ok, e = pcall(f._scripts.OnEvent, f, ev, ...)
            if not ok then note("EVENTFAIL " .. ev .. ": " .. tostring(e)) end
        end
    end
end
fire("ADDON_LOADED", "SecretGPS")
fire("PLAYER_LOGIN")
note("login fired")
try("v1 save migrates ticks to per-character store, seeds each alt", function()
    local savedA, savedC = SecretGPSDB, SecretGPSCharDB
    SecretGPSDB = { version = 1, settings = { wpProvider = "native", textScale = 1.1 },
        manualSteps = { ["some-id"] = { [2] = true } }, manualComplete = { ["done-id"] = true },
        tracked = { id = "some-id", step = 2 } }
    SecretGPSCharDB = nil
    NS.EnsureDB()
    assert(SecretGPSDB.version == 2, "account db not stamped v2")
    assert(SecretGPSDB.manualSteps == nil and SecretGPSDB.tracked == nil, "account db still holds per-character fields")
    assert(SecretGPSDB.settings.wpProvider == "native", "settings lost in migration")
    assert(NS.cdb.manualSteps["some-id"][2] == true, "manual tick not carried to the character")
    assert(NS.cdb.manualComplete["done-id"] == true, "manual complete not carried")
    assert(NS.cdb.tracked and NS.cdb.tracked.step == 2, "tracked secret not carried")
    -- a second character logging in later is seeded too, independently
    local first = SecretGPSCharDB
    first.manualSteps["some-id"][3] = true
    SecretGPSCharDB = nil
    NS.EnsureDB()
    assert(NS.cdb.manualSteps["some-id"][2] == true, "alt not seeded")
    assert(NS.cdb.manualSteps["some-id"][3] == nil, "alt shares the first character's ticks")
    SecretGPSDB, SecretGPSCharDB = savedA, savedC
    NS.EnsureDB()
end)
try("slash toggle open", function() SlashCmdList["SECRETSGPS"]("") end)
try("frame shown", function() assert(SecretGPSFrame and SecretGPSFrame:IsShown(), "frame not shown") end)
try("debug slash", function() SlashCmdList["SECRETSGPS"]("debug") end)
try("mindseeker slash", function() SlashCmdList["SECRETSGPS"]("mindseeker") end)
try("select each entry + refresh", function()
    for i = 1, #NS.Entries do NS.UI.Select(NS.Entries[i].id) end
end)
try("waypoint on a mapID step", function()
    for i = 1, #NS.Entries do
        local e = NS.Entries[i]
        for j = 1, #(e.steps or {}) do
            local s = e.steps[j]
            if s.mapID and s.x and s.y then
                local ok = NS.SetWaypoint(s, e.name)
                assert(ok == true, "SetWaypoint did not take native path")
                assert(WAYPOINT and WAYPOINT.mapID == s.mapID, "waypoint point mismatch")
                return
            end
        end
    end
    note("no mapID step found (allowed only for forever toc)")
end)
try("zone-table pin: retail resolves, forever keeps /way", function()
    local retail = NS.Entries[1] and NS.Entries[1].game == "retail"
    local step = { text = "t", zone = retail and "Boralus" or "Westfall", x = 61.5, y = 83.6 }
    WAYPOINT = nil
    local ok = NS.SetWaypoint(step, "zone test")
    if retail then
        assert(ok == true and WAYPOINT and WAYPOINT.mapID == 1161,
            "Boralus step did not pin via the zone table")
    else
        assert(ok == false and WAYPOINT == nil, "forever step pinned via a retail map ID")
    end
    assert(step.mapID == nil, "SetWaypoint mutated the data step")
end)
try("pin all remaining (TomTom) + refuses without TomTom", function()
    local saved = TomTom
    TomTom = nil
    local e = NS.ById["voidtalon"] or NS.Entries[1]
    assert(NS.PinAllRemaining(e) == 0, "pin all ran without TomTom")
    local pins = 0
    TomTom = { AddWaypoint = function() pins = pins + 1 end }
    NS.cdb.manualSteps[e.id] = nil
    local want = 0
    for i = 1, #e.steps do
        local s = NS.ResolveWaypointStep(e.steps[i])
        if s and s.mapID and not NS.IsStepDone(e, i) then want = want + 1 end
    end
    local n = NS.PinAllRemaining(e)
    assert(n == want and pins == want, "pinned " .. n .. "/" .. pins .. ", want " .. want)
    if e.id == "voidtalon" then assert(n == 28, "voidtalon should pin its 28 portal spots, got " .. n) end
    -- ticked steps are skipped
    if want > 0 then
        for i = 1, #e.steps do
            local s = NS.ResolveWaypointStep(e.steps[i])
            if s and s.mapID then NS.ToggleStep(e, i) break end
        end
        pins = 0
        assert(NS.PinAllRemaining(e) == want - 1, "a ticked step was still pinned")
        NS.cdb.manualSteps[e.id] = nil
    end
    TomTom = saved
end)
try("quest-flag step reads done (47826)", function()
    for i = 1, #NS.Entries do
        local e = NS.Entries[i]
        for j = 1, #(e.steps or {}) do
            if e.steps[j].questFlag == 47826 then
                assert(NS.IsStepDone(e, j) == true, "47826 step not done")
                return
            end
        end
    end
end)
try("manual tick toggles", function()
    -- Use a step with NO quest flag: a flagged step's done-state is owned
    -- by the game (e.g. Lucid step 1, flag 47826, is done in this mock and
    -- correctly cannot be flipped manually).
    for i = 1, #NS.Entries do
        local e = NS.Entries[i]
        for j = 1, #(e.steps or {}) do
            if not e.steps[j].questFlag then
                local before = NS.IsStepDone(e, j)
                NS.ToggleStep(e, j)
                assert(NS.IsStepDone(e, j) == (not before), "toggle failed")
                NS.ToggleStep(e, j)
                assert(NS.IsStepDone(e, j) == before, "untoggle failed")
                return
            end
        end
    end
    error("no unflagged step found to toggle")
end)
try("tomtom waypoint path", function()
    TomTom = { AddWaypoint = function(_, m, x, y, opts)
        TOMTOM_POINT = { mapID = m, x = x, y = y, title = opts and opts.title } end }
    NS.db.settings.wpProvider = "tomtom"
    local found = false
    for i = 1, #NS.Entries do
        local e = NS.Entries[i]
        for j = 1, #(e.steps or {}) do
            local s = e.steps[j]
            if s.mapID and s.x and s.y then
                local ok = NS.SetWaypoint(s, e.name)
                assert(ok == true, "tomtom SetWaypoint failed")
                assert(TOMTOM_POINT and TOMTOM_POINT.mapID == s.mapID, "tomtom point mismatch")
                found = true
                break
            end
        end
        if found then break end
    end
    if not found then note("no mapID step for tomtom test (allowed only for forever toc)") end
    NS.db.settings.wpProvider = "auto"
    TomTom = nil
end)
try("tracker start, stop", function()
    for i = 1, #NS.Entries do
        local e = NS.Entries[i]
        if e.steps and #e.steps >= 2 then
            NS.Tracker.Start(e)
            assert(NS.cdb.tracked and NS.cdb.tracked.id == e.id, "tracked id mismatch")
            assert(SecretGPSTrackerFrame and SecretGPSTrackerFrame:IsShown(), "tracker not shown")
            NS.Tracker.Stop()
            assert(NS.cdb.tracked == nil, "stop did not clear tracking")
            return
        end
    end
    error("no multi-step entry found")
end)
try("tracker next ticks + advances", function()
    for i = 1, #NS.Entries do
        local e = NS.Entries[i]
        if e.steps and #e.steps >= 2 and not e.steps[1].questFlag then
            NS.Tracker.Start(e, 1)
            NS.Tracker.Next()
            assert(NS.IsStepDone(e, 1) == true, "next did not tick step 1")
            local _, idx = NS.Tracker.Current()
            assert(idx == 2 or NS.IsEntrySolved(e), "next did not advance")
            NS.Tracker.Stop()
            return
        end
    end
    error("no suitable entry for next test")
end)
try("tracker next on last step wraps to earlier undone step", function()
    for i = 1, #NS.Entries do
        local e = NS.Entries[i]
        local flagged = false
        for j = 1, #(e.steps or {}) do
            if e.steps[j].questFlag then flagged = true end
        end
        if e.steps and #e.steps >= 3 and not flagged then
            NS.cdb.manualSteps[e.id] = nil
            NS.cdb.manualComplete[e.id] = nil
            if not NS.IsEntrySolved(e) then
                NS.Tracker.Start(e, #e.steps)
                NS.Tracker.Next()
                assert(NS.IsStepDone(e, #e.steps) == true, "next did not tick the last step")
                local _, idx = NS.Tracker.Current()
                assert(idx == 1, "next on the last step did not wrap to step 1 (idx=" .. tostring(idx) .. ")")
                NS.Tracker.Stop()
                NS.cdb.manualSteps[e.id] = nil
                return
            end
        end
    end
    error("no suitable entry for wrap test")
end)
try("tracker skips flag-done step (lucid)", function()
    local e = NS.ById["lucid-nightmare"]
    if not e then note("lucid not in this toc (forever) - skipped") return end
    NS.Tracker.Start(e)
    local _, idx = NS.Tracker.Current()
    assert(idx > 1, "start did not skip flag-done step 1 (idx=" .. tostring(idx) .. ")")
    NS.Tracker.Stop()
end)
try("wp + track slash commands", function()
    SlashCmdList["SECRETSGPS"]("wp native")
    assert(NS.db.settings.wpProvider == "native", "wp slash did not set provider")
    SlashCmdList["SECRETSGPS"]("wp auto")
    SlashCmdList["SECRETSGPS"]("track")
    SlashCmdList["SECRETSGPS"]("untrack")
    assert(NS.cdb.tracked == nil, "untrack slash left tracking active")
    SlashCmdList["SECRETSGPS"]("pinall")
end)
try("text scale cycles via slash", function()
    local before = NS.db.settings.textScale
    SlashCmdList["SECRETSGPS"]("text")
    assert(NS.db.settings.textScale ~= before, "text scale did not change")
    SlashCmdList["SECRETSGPS"]("text")
end)
try("mind-seeker filter shows only mind-seeker secrets", function()
    local want = 0
    for i = 1, #NS.Entries do if NS.Entries[i].mindSeeker then want = want + 1 end end
    NS.db.typeFilter = "mindseeker"
    NS.UI.Refresh()
    local seen = 0
    for i = 1, #NS.UI.listRows do
        local r = NS.UI.listRows[i]
        if r and r:IsShown() and r.entryId then
            seen = seen + 1
            assert(NS.ById[r.entryId].mindSeeker, r.entryId .. " is not a Mind-Seeker secret")
        end
    end
    -- the list pages 15 rows at a time, so a full page or all of them
    assert(seen == math.min(want, #NS.UI.listRows), "saw " .. seen .. " rows, want " .. math.min(want, #NS.UI.listRows))
    assert(NS.UI.typeBtn:GetText() == (want > 0 and "Type: Mind-Seeker" or NS.UI.typeBtn:GetText()), "type button label")
    NS.db.typeFilter = "all"
    NS.UI.Refresh()
end)
try("type filter narrows list", function()
    local function visibleIds()
        local ids = {}
        for i = 1, #NS.UI.listRows do
            local r = NS.UI.listRows[i]
            if r and r:IsShown() and r.entryId then ids[#ids + 1] = r.entryId end
        end
        return ids
    end
    local t0 = NS.Entries[1].type
    NS.db.typeFilter = t0
    NS.UI.Refresh()
    local vis = visibleIds()
    assert(#vis > 0, "type filter showed no rows")
    for i = 1, #vis do
        assert(NS.ById[vis[i]].type == t0, "row " .. vis[i] .. " is not type " .. t0)
    end
    NS.db.typeFilter = "all"
    NS.UI.Refresh()
    assert(visibleIds()[1] == NS.Entries[1].id, "clearing type filter did not restore")
end)
try("search matches step text", function()
    local function visibleIds()
        local ids = {}
        for i = 1, #NS.UI.listRows do
            local r = NS.UI.listRows[i]
            if r and r:IsShown() and r.entryId then ids[#ids + 1] = r.entryId end
        end
        return ids
    end
    local e1 = NS.Entries[1]
    local hay = (tostring(e1.name or "") .. " " .. tostring(e1.zone or "") .. " " ..
        tostring(e1.reward or "") .. " " .. tostring(e1.type or "")):lower()
    local word = nil
    for j = 1, #(e1.steps or {}) do
        local txt = (tostring(e1.steps[j].text or "") .. " " ..
            tostring(e1.steps[j].zone or "")):lower()
        for w in txt:gmatch("[%a][%a]+") do
            if #w >= 6 and not hay:find(w, 1, true) then word = w break end
        end
        if word then break end
    end
    assert(word, "no step-only word found for first entry")
    local box = NS.UI.searchBox
    box:SetText(word)
    box._scripts.OnTextChanged(box)
    local vis = visibleIds()
    local found = false
    for i = 1, #vis do if vis[i] == e1.id then found = true end end
    assert(found, "step-word search '" .. word .. "' did not surface " .. e1.id)
    box:SetText("")
    box._scripts.OnTextChanged(box)
    assert(visibleIds()[1] == e1.id, "clearing search did not restore")
end)
try("hide solved + restore", function()
    local function visibleIds()
        local ids = {}
        for i = 1, #NS.UI.listRows do
            local r = NS.UI.listRows[i]
            if r and r:IsShown() and r.entryId then ids[#ids + 1] = r.entryId end
        end
        return ids
    end
    local e1 = NS.Entries[1]
    NS.ToggleEntryComplete(e1)
    assert(NS.IsEntrySolved(e1), "manual complete did not solve entry")
    NS.db.hideCompleted = true
    NS.UI.Refresh()
    for i = 1, #visibleIds() do
        assert(visibleIds()[i] ~= e1.id, "solved entry still visible with hide on")
    end
    NS.db.hideCompleted = false
    NS.ToggleEntryComplete(e1)
    NS.UI.Refresh()
    assert(visibleIds()[1] == e1.id, "restore did not bring first entry back")
end)
try("quest-log update refresh", function() fire("QUEST_LOG_UPDATE") end)
try("learning a mount solves a tracked secret + says collected", function()
    local e
    for i = 1, #NS.Entries do
        local c = NS.Entries[i].collection
        if c and c.kind == "mount" and type(c.id) == "number" and #NS.Entries[i].steps >= 2 then
            e = NS.Entries[i] break
        end
    end
    if not e then note("no mount-collection entry in this toc - skipped") return end
    local owned = false
    C_MountJournal = { GetMountInfoByID = function(id)
        return nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, (owned and id == e.collection.id) end }
    NS.cdb.manualSteps[e.id] = nil
    NS.cdb.manualComplete[e.id] = nil
    NS.Tracker.Start(e, 1)
    assert(not NS.IsEntrySolved(e), "entry solved before the mount was learned")
    owned = true
    fire("NEW_MOUNT_ADDED", e.collection.id)
    assert(NS.IsEntrySolved(e), "entry not solved after NEW_MOUNT_ADDED")
    assert(tostring(NS.Tracker.lastCountText):find("collected"),
        "tracker text does not say collected: " .. tostring(NS.Tracker.lastCountText))
    NS.Tracker.Stop()
    C_MountJournal = nil
end)
try("slash toggle close", function() SlashCmdList["SECRETSGPS"]("") end)
try("minimap button exists + toggles catalog", function()
    local mb = _G["SecretGPSMinimapButton"]
    assert(mb, "minimap button was not created")
    assert(mb._scripts and mb._scripts.OnClick, "minimap button has no OnClick")
    assert(mb._scripts.OnDragStart and mb._scripts.OnDragStop,
        "minimap button drag scripts missing")
    local before = SecretGPSFrame:IsShown()
    mb._scripts.OnClick(mb, "LeftButton")
    assert(SecretGPSFrame:IsShown() == (not before),
        "minimap left-click did not toggle the catalog")
    mb._scripts.OnClick(mb, "LeftButton")
    assert(SecretGPSFrame:IsShown() == before,
        "second minimap left-click did not toggle back")
end)
local msSolved, msTotal = NS.MindSeekerCounts()
note("mindseeker counts: " .. msSolved .. "/" .. msTotal)
note("chat lines: " .. #CHATLOG)
note("DONE")
return table.concat(report, "\n")
"""


def toc_files(toc_name):
    lines = (ADDON / toc_name).read_text().splitlines()
    return [ln.strip() for ln in lines if ln.strip().endswith(".lua")]


def main():
    toc = sys.argv[1] if len(sys.argv) > 1 else "SecretGPS.toc"
    files = toc_files(toc)
    rt = lupa.LuaRuntime(unpack_returned_tuples=True)
    rt.execute(PRELUDE)
    rt.globals().FILES = rt.table_from(
        [{"name": n, "code": (ADDON / n).read_text()} for n in files])
    out = rt.execute(DRIVER)
    print(f"--- harness ({toc}: {', '.join(files)}) ---")
    print(out)
    bad = [ln for ln in out.splitlines() if "FAIL" in ln]
    if bad or "DONE" not in out:
        print("HARNESS: FAIL")
        sys.exit(1)
    print("HARNESS: PASS")


if __name__ == "__main__":
    main()
