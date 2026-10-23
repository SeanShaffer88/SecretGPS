#!/usr/bin/env python3
"""SecretsGPS startup-simulation harness.

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
ADDON = ROOT / "SecretsGPS"

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
    local ok, e = pcall(fn, "SecretsGPS", NS)
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
fire("ADDON_LOADED", "SecretsGPS")
fire("PLAYER_LOGIN")
note("login fired")
try("slash toggle open", function() SlashCmdList["SECRETSGPS"]("") end)
try("frame shown", function() assert(SecretsGPSFrame and SecretsGPSFrame:IsShown(), "frame not shown") end)
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
            assert(NS.db.tracked and NS.db.tracked.id == e.id, "tracked id mismatch")
            assert(SecretsGPSTrackerFrame and SecretsGPSTrackerFrame:IsShown(), "tracker not shown")
            NS.Tracker.Stop()
            assert(NS.db.tracked == nil, "stop did not clear tracking")
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
    assert(NS.db.tracked == nil, "untrack slash left tracking active")
end)
try("quest-log update refresh", function() fire("QUEST_LOG_UPDATE") end)
try("slash toggle close", function() SlashCmdList["SECRETSGPS"]("") end)
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
    toc = sys.argv[1] if len(sys.argv) > 1 else "SecretsGPS.toc"
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
