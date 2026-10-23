-- SecretGPS - SecretTracker window
-- When the player tracks a secret (from the catalog, a single step,
-- or /sgps track), this small window stays on screen and guides
-- them step by step: it shows the current step, sets its waypoint
-- (TomTom or native, per the waypoint provider setting), advances
-- when a step is done - automatically for quest-flag steps, via the
-- Done button for manual ones - and announces completion.
-- Tracking state persists in SavedVariables (ns.db.tracked).
local _, ns = ...

local Tracker = {}
ns.Tracker = Tracker

local frame, nameFS, countFS, stepFS, zoneFS, doneBtn

local function Current()
    local t = ns.db and ns.db.tracked
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
    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 24,
        insets = { left = 6, right = 6, top = 6, bottom = 6 },
    })
    f:SetBackdropColor(0.05, 0.02, 0.02, 0.95)
    frame = f
    ns.Tracker.frame = f

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 14, -12)
    title:SetText("|cffe5484dSecret Tracker|r")
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

    countFS = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    countFS:SetPoint("TOPLEFT", 14, -58)
    countFS:SetWidth(302)
    countFS:SetJustifyH("LEFT")

    stepFS = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    stepFS:SetPoint("TOPLEFT", 14, -78)
    stepFS:SetWidth(302)
    stepFS:SetHeight(62)
    stepFS:SetJustifyH("LEFT")
    stepFS:SetJustifyV("TOP")
    stepFS:SetWordWrap(true)

    zoneFS = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    zoneFS:SetPoint("TOPLEFT", 14, -142)
    zoneFS:SetWidth(302)
    zoneFS:SetJustifyH("LEFT")

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
    nameFS:SetText(tostring(e.name))
    if ns.IsEntrySolved(e) then
        countFS:SetText("Secret complete - all " .. total .. " steps done.")
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
    ns.db.tracked.step = idx
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
    if not ns.db then return end
    local idx = stepIdx or FirstUndone(e, 1) or 1
    ns.db.tracked = { id = e.id, step = idx }
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
    if ns.db then ns.db.tracked = nil end
    if frame then frame:Hide() end
    ns.Print("Tracking stopped.")
    if ns.UI and ns.UI.Refresh then ns.UI.Refresh() end
end

function Tracker.Toggle()
    local e = Current()
    if not e then
        if ns.UI and ns.UI.Toggle then ns.UI.Toggle() end
        return
    end
    Build()
    if frame:IsShown() then frame:Hide() else frame:Show() Tracker.Refresh() end
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
    local nxt = FirstUndone(e, idx + 1)
    if nxt then
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
-- game, advance to the next unfinished step automatically.
function Tracker.OnQuestUpdate()
    local e, idx = Current()
    if not e or not frame or not frame:IsShown() then
        if e then Tracker.Refresh() end
        return
    end
    if ns.IsStepDone(e, idx) then
        local nxt = FirstUndone(e, idx + 1) or FirstUndone(e, 1)
        if nxt and nxt ~= idx then
            ns.Print("Step done - advancing your tracker.")
            GotoStep(nxt, true)
            return
        end
    end
    Tracker.Refresh()
end

-- Reopen the tracker on login when a secret was being tracked.
function Tracker.Restore()
    if Current() then
        Build()
        frame:Show()
        Tracker.Refresh()
    end
end
