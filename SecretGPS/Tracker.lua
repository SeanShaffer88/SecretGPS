-- SecretGPS - SecretTracker window
-- When the player tracks a secret (from the catalog, a single step,
-- or /sgps track), this small window stays on screen and guides
-- them step by step: it shows the current step, sets its waypoint
-- (TomTom or native, per the waypoint provider setting), advances
-- when a step is done - automatically for quest-flag steps, via the
-- Done button for manual ones - and announces completion.
-- Tracking state persists in SavedVariables (ns.cdb.tracked).
local _, ns = ...

local Tracker = {}
ns.Tracker = Tracker

local frame, nameFS, countFS, stepFS, zoneFS, doneBtn, barFill
local soundPlayedFor -- entry id the completion sound already played for

local function Current()
    local t = ns.cdb and ns.cdb.tracked
    if not t or not t.id then return nil end
    local e = ns.ById and ns.ById[t.id]
    if not e then return nil end
    return e, math.max(1, math.min(t.step or 1, #(e.steps or { 1 })))
end
Tracker.Current = Current

local function FirstUndone(e, from)
    if not e or not e.steps then return nil end
    for i = from or 1, #e.steps do
        if not ns.IsStepDone(e, i) then return i end
    end
    return nil
end

local function Build()
    if frame then return end
    local f = CreateFrame("Frame", "SecretGPSTrackerFrame", UIParent, "BackdropTemplate")
    f:SetSize(330, 196)
    f:SetPoint("CENTER", 0, 160)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetClampedToScreen(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", function(self) self:StartMoving() end)
    f:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    -- Same classic quest log look as the catalog: dark frame,
    -- parchment panel for the step text.
    if ns.StyleQuestLog then ns.StyleQuestLog(f) end
    frame = f
    ns.Tracker.frame = f
    local ts = ns.db and ns.db.settings and ns.db.settings.textScale
    if type(ts) == "number" and f.SetScale then f:SetScale(ts) end

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 14, -12)
    title:SetText("Secret Tracker")
    title:SetTextColor(1, 0.85, 0.4)
    local close = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    close:SetSize(20, 20)
    close:SetPoint("TOPRIGHT", -10, -10)
    close:SetText("X")
    close:SetScript("OnClick", function() f:Hide() end)

    nameFS = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    nameFS:SetPoint("TOPLEFT", 14, -38)
    nameFS:SetWidth(302)
    nameFS:SetJustifyH("LEFT")
    nameFS:SetWordWrap(true)
    nameFS:SetTextColor(1, 0.85, 0.45)

    countFS = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    countFS:SetPoint("TOPLEFT", 14, -58)
    countFS:SetWidth(302)
    countFS:SetJustifyH("LEFT")
    countFS:SetTextColor(0.85, 0.78, 0.6)

    -- Progress bar (A8): pale track, brick-red fill.
    local barBg = f:CreateTexture(nil, "ARTWORK")
    barBg:SetPoint("TOPLEFT", 14, -72)
    barBg:SetSize(302, 6)
    barBg:SetColorTexture(0.93, 0.86, 0.68, 0.25)
    barFill = f:CreateTexture(nil, "OVERLAY")
    barFill:SetPoint("TOPLEFT", 14, -72)
    barFill:SetSize(1, 6)
    barFill:SetColorTexture(0.75, 0.22, 0.1, 0.95)

    -- Parchment panel behind the step text and zone line.
    local stepPanel = CreateFrame("Frame", nil, f, "BackdropTemplate")
    stepPanel:SetPoint("TOPLEFT", 10, -80)
    stepPanel:SetPoint("BOTTOMRIGHT", -10, 44)
    if ns.StylePanel then ns.StylePanel(stepPanel, true) end

    stepFS = stepPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    stepFS:SetPoint("TOPLEFT", 8, -8)
    stepFS:SetWidth(286)
    stepFS:SetHeight(56)
    stepFS:SetJustifyH("LEFT")
    stepFS:SetJustifyV("TOP")
    stepFS:SetWordWrap(true)
    stepFS:SetTextColor(0.16, 0.11, 0.05)

    zoneFS = stepPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    zoneFS:SetPoint("BOTTOMLEFT", stepPanel, "BOTTOMLEFT", 8, 6)
    zoneFS:SetWidth(286)
    zoneFS:SetJustifyH("LEFT")
    zoneFS:SetTextColor(0.32, 0.24, 0.14)

    local prev = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    prev:SetSize(64, 22)
    prev:SetPoint("BOTTOMLEFT", 12, 12)
    prev:SetText("< Prev")
    prev:SetScript("OnClick", function() Tracker.Prev() end)

    local wp = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    wp:SetSize(52, 22)
    wp:SetPoint("LEFT", prev, "RIGHT", 6, 0)
    wp:SetText("WP")
    wp:SetScript("OnClick", function()
        local e, idx = Current()
        if e and e.steps[idx] then ns.SetWaypoint(e.steps[idx], e.name) end
    end)

    doneBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    doneBtn:SetSize(84, 22)
    doneBtn:SetPoint("LEFT", wp, "RIGHT", 6, 0)
    doneBtn:SetText("Done >")
    doneBtn:SetScript("OnClick", function() Tracker.Next() end)

    local stop = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    stop:SetSize(58, 22)
    stop:SetPoint("LEFT", doneBtn, "RIGHT", 6, 0)
    stop:SetText("Stop")
    stop:SetScript("OnClick", function() Tracker.Stop() end)

    f:Hide()
end

-- A8: completion sound, guarded - resolves the client's quest
-- completed soundkit at call time and stays silent where a client
-- does not expose it. Plays at most once per entry per session,
-- and only while the tracker is visible.
local function PlayCompleteSound()
    if not (PlaySound and SOUNDKIT) then return end
    local id = SOUNDKIT.QUEST_COMPLETED
    if type(id) == "number" then pcall(PlaySound, id) end
end

local function MaybeCelebrate(e)
    if ns.IsEntrySolved(e) then
        if soundPlayedFor ~= e.id then
            soundPlayedFor = e.id
            if frame and frame:IsShown() then PlayCompleteSound() end
        end
    elseif soundPlayedFor == e.id then
        soundPlayedFor = nil
    end
end

function Tracker.Refresh()
    if not frame then return end
    local e, idx = Current()
    if not e then
        frame:Hide()
        return
    end
    local total = #e.steps
    local done = 0
    for i = 1, total do
        if ns.IsStepDone(e, i) then done = done + 1 end
    end
    if barFill then
        local w = total > 0 and (302 * done / total) or 0
        barFill:SetWidth(math.max(1, w))
    end
    MaybeCelebrate(e)
    nameFS:SetText(tostring(e.name))
    if ns.IsEntrySolved(e) then
        if barFill then barFill:SetWidth(302) end
        -- Solved does not always mean every step was ticked: the
        -- reward may already be in the journal, or the game's own
        -- completion flags may be set. Say which.
        local how
        if done == total then
            how = "all " .. total .. " steps done."
        elseif ns.IsCollected and ns.IsCollected(e) then
            how = "reward already collected (" .. done .. " of " .. total .. " steps ticked)."
        else
            how = "the game records it as done (" .. done .. " of " .. total .. " steps ticked)."
        end
        countFS:SetText("Secret complete - " .. how)
        Tracker.lastCountText = countFS:GetText()
        stepFS:SetText("You have everything this guide covers. Pick another secret from the catalog (/sgps) whenever you are ready.")
        zoneFS:SetText(tostring(e.reward or ""))
        doneBtn:SetText("Done")
        return
    end
    local pct = total > 0 and math.floor(done * 100 / total) or 0
    countFS:SetText("Step " .. idx .. " of " .. total .. " - " .. pct .. "% complete")
    local step = e.steps[idx]
    stepFS:SetText(tostring(step and step.text or ""))
    zoneFS:SetText(tostring((step and step.zone) or e.zone or ""))
    doneBtn:SetText("Done >")
end

local function GotoStep(idx, setWay)
    local e = Current()
    if not e then return end
    ns.cdb.tracked.step = idx
    Build()
    frame:Show()
    Tracker.Refresh()
    if setWay and e.steps[idx] then
        ns.SetWaypoint(e.steps[idx], e.name)
    end
    if ns.UI and ns.UI.Refresh then ns.UI.Refresh() end
end

function Tracker.Start(entry, stepIdx)
    local e = entry
    if type(entry) == "string" then e = ns.ById and ns.ById[entry] end
    if not e or not e.steps or #e.steps == 0 then
        ns.Print("That secret has no steps to track.")
        return
    end
    if not ns.cdb then return end
    local idx = stepIdx or FirstUndone(e, 1) or 1
    ns.cdb.tracked = { id = e.id, step = idx }
    if ns.IsEntrySolved(e) then soundPlayedFor = e.id end -- no fanfare for review opens
    Build()
    frame:Show()
    Tracker.Refresh()
    if ns.IsEntrySolved(e) then
        ns.Print("Already solved: " .. tostring(e.name) .. " - tracking opened so you can review its steps.")
    else
        ns.Print("Now tracking: " .. tostring(e.name) .. " (step " .. idx .. " of " .. #e.steps .. ")")
        if e.steps[idx] then ns.SetWaypoint(e.steps[idx], e.name) end
    end
    if ns.UI and ns.UI.Refresh then ns.UI.Refresh() end
end

function Tracker.Stop()
    if ns.cdb then ns.cdb.tracked = nil end
    if frame then frame:Hide() end
    ns.Print("Tracking stopped.")
    if ns.UI and ns.UI.Refresh then ns.UI.Refresh() end
end

function Tracker.SetScale(s)
    if frame and frame.SetScale and type(s) == "number" then
        frame:SetScale(s)
    end
end

function Tracker.Toggle()
    local e = Current()
    if not e then
        if ns.UI and ns.UI.Toggle then ns.UI.Toggle() end
        return
    end
    Build()
    if frame:IsShown() then
        frame:Hide()
    else
        frame:Show()
        Tracker.Refresh()
        -- If progress advanced while hidden (A5), put the player on
        -- the current step's waypoint when the window comes back.
        local e2, idx2 = Current()
        if e2 and e2.steps and e2.steps[idx2]
            and not ns.IsEntrySolved(e2) then
            ns.SetWaypoint(e2.steps[idx2], e2.name)
        end
    end
end

function Tracker.Prev()
    local e, idx = Current()
    if not e then return end
    if idx > 1 then GotoStep(idx - 1, true) end
end

function Tracker.Next()
    local e, idx = Current()
    if not e then return end
    if ns.IsEntrySolved(e) then
        Tracker.Stop()
        return
    end
    local step = e.steps[idx]
    if step and step.questFlag and not ns.IsStepDone(e, idx) then
        ns.Print("This step completes itself when the game records it - follow the waypoint and it will advance on its own.")
        ns.SetWaypoint(step, e.name)
        return
    end
    if not ns.IsStepDone(e, idx) then
        ns.ToggleStep(e, idx)
    end
    -- Wrap to earlier unfinished steps (a guide tracked from a later
    -- step with Trk), the same way OnQuestUpdate does - otherwise
    -- Done on the last step leaves the player stuck on it.
    local nxt = FirstUndone(e, idx + 1) or FirstUndone(e, 1)
    if nxt and nxt ~= idx then
        GotoStep(nxt, true)
    else
        Tracker.Refresh()
        if ns.IsEntrySolved(e) then
            ns.Print("Secret complete: " .. tostring(e.name))
        end
        if ns.UI and ns.UI.Refresh then ns.UI.Refresh() end
    end
end

-- Called on QUEST_LOG_UPDATE: if the tracked step just completed in
-- game, advance to the next unfinished step automatically. A5: the
-- saved position advances even while the tracker window is hidden
-- (progress is never lost); the announcement and waypoint move
-- happen when the window is shown, and showing it re-sets the
-- current step's waypoint.
function Tracker.OnQuestUpdate()
    local e, idx = Current()
    if not e then return end
    if ns.IsStepDone(e, idx) then
        local nxt = FirstUndone(e, idx + 1) or FirstUndone(e, 1)
        if nxt and nxt ~= idx then
            if frame and frame:IsShown() then
                ns.Print("Step done - advancing your tracker.")
                GotoStep(nxt, true)
            else
                ns.cdb.tracked.step = nxt
                if ns.UI and ns.UI.Refresh then ns.UI.Refresh() end
            end
            return
        end
    end
    if frame and frame:IsShown() then Tracker.Refresh() end
end

-- Reopen the tracker on login when a secret was being tracked.
function Tracker.Restore()
    if Current() then
        Build()
        frame:Show()
        Tracker.Refresh()
    end
end
