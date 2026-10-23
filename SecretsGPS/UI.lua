-- SecretsGPS - UI
-- Catalog (left) + step-by-step guide (right) in one movable window.
-- Frames that need a backdrop are created WITH BackdropTemplate:
-- plain frames have no SetBackdrop on modern Mainline / Forever.
local _, ns = ...
ns.UI = {}
local UI = ns.UI

local TYPE_LABELS = {
    mount = "Mount", pet = "Pet", toy = "Toy", transmog = "Transmog",
    title = "Title", achievement = "Achievement", questline = "Questline",
    hunterpet = "Hunter Pet", form = "Form", vendor = "Secret Vendor",
    forever_item = "Forever Item",
}
local EXPANSION_LABELS = {
    vanilla = "Vanilla", tbc = "TBC", wotlk = "WotLK", cata = "Cataclysm",
    mop = "Mists of Pandaria", wod = "Warlords of Draenor", legion = "Legion",
    bfa = "Battle for Azeroth", shadowlands = "Shadowlands",
    dragonflight = "Dragonflight", tww = "The War Within",
    midnight = "Midnight", forever = "WoW: Forever",
}

local LIST_ROWS = 15
local STEP_ROWS = 9

local state = {
    built = false,
    selectedId = nil,
    listOffset = 0,
    stepOffset = 0,
    search = "",
    filtered = {},
}

local function EntryTypeLabel(e)
    return TYPE_LABELS[e.type] or tostring(e.type or "")
end

local function SoloLabel(e)
    if type(e.solo) == "string" then return e.solo end
    if e.solo == true then return "Solo" end
    if e.solo == false then return "Group" end
    if e.groupSize then return "Group: " .. tostring(e.groupSize) end
    return "Solo"
end

local function MatchesFilters(e)
    local db = ns.db
    local tf = (db and db.typeFilter) or "all"
    if tf ~= "all" and e.type ~= tf then return false end
    if db and db.hideCompleted and ns.IsEntrySolved(e) then return false end
    if state.search ~= "" then
        local hay = (tostring(e.name or "") .. " " .. tostring(e.zone or "") .. " " ..
            tostring(e.reward or "") .. " " .. EntryTypeLabel(e)):lower()
        if not hay:find(state.search, 1, true) then return false end
    end
    return true
end

local function ComputeFiltered()
    state.filtered = {}
    for i = 1, #ns.Entries do
        local e = ns.Entries[i]
        if MatchesFilters(e) then state.filtered[#state.filtered + 1] = e end
    end
    if state.listOffset > #state.filtered then state.listOffset = 0 end
    if not state.selectedId and state.filtered[1] then
        state.selectedId = state.filtered[1].id
    end
end

local function SelectedEntry()
    if state.selectedId and ns.ById then return ns.ById[state.selectedId] end
    return nil
end

local function MetaText(e)
    local lines = {}
    lines[#lines + 1] = EntryTypeLabel(e) .. "  |  " ..
        (EXPANSION_LABELS[e.expansion] or tostring(e.expansion or "")) ..
        (e.mindSeeker and "  |  Mind-Seeker secret" or "")
    lines[#lines + 1] = "Reward: " .. tostring(e.reward or "-")
    if e.zone then lines[#lines + 1] = "Zone: " .. tostring(e.zone) end
    local meta = SoloLabel(e)
    if e.difficulty then meta = meta .. "  |  Difficulty " .. tostring(e.difficulty) .. "/5" end
    if e.estTime then meta = meta .. "  |  " .. tostring(e.estTime) end
    lines[#lines + 1] = meta
    if e.timeGate then lines[#lines + 1] = "Time gate: " .. tostring(e.timeGate) end
    if e.rng then lines[#lines + 1] = "RNG: " .. tostring(e.rng) end
    if e.prereq then lines[#lines + 1] = "Prerequisite: " .. tostring(e.prereq) end
    if e.status then lines[#lines + 1] = "Status: " .. tostring(e.status) end
    if e.verifiedPatch then lines[#lines + 1] = "Data verified: " .. tostring(e.verifiedPatch) end
    return table.concat(lines, "\n")
end

function UI.Refresh()
    if not state.built then return end
    ComputeFiltered()
    if UI.msText then UI.msText:SetText(ns.MindSeekerSummary()) end
    for i = 1, LIST_ROWS do
        local row = UI.listRows[i]
        local e = state.filtered[state.listOffset + i]
        if row then
            if e then
                local done, total = ns.EntryStepProgress(e)
                local mark = ns.IsEntrySolved(e) and "|cff7dff7d[done]|r " or ""
                local tmark = (ns.db and ns.db.tracked and ns.db.tracked.id == e.id) and "|cffe5484d>> |r" or ""
                row.text:SetText(tmark .. mark .. tostring(e.name))
                row.sub:SetText(EntryTypeLabel(e) .. " - " ..
                    (EXPANSION_LABELS[e.expansion] or "") .. "  " .. done .. "/" .. total)
                row.entryId = e.id
                row:Show()
            else
                row.entryId = nil
                row:Hide()
            end
        end
    end
    local e = SelectedEntry()
    if UI.detailName then
        if e then
            UI.detailName:SetText(tostring(e.name))
            UI.detailMeta:SetText(MetaText(e))
            if UI.detailSource then
                UI.detailSource:SetText("Source guide: " .. tostring(e.source or "-"))
            end
        else
            UI.detailName:SetText("No secret selected")
            UI.detailMeta:SetText("")
            if UI.detailSource then UI.detailSource:SetText("") end
        end
    end
    for i = 1, STEP_ROWS do
        local row = UI.stepRows[i]
        if row then
            local idx = state.stepOffset + i
            local step = e and e.steps and e.steps[idx] or nil
            if step then
                local box = ns.IsStepDone(e, idx) and "|cff7dff7d[x]|r" or "[ ]"
                local wp = (step.x and step.y) and "  |cff6ec3ff[WP]|r" or ""
                row.text:SetText(box .. " " .. idx .. ". " .. tostring(step.text) .. wp)
                row.stepIndex = idx
                if row.wpBtn then
                    if step.x and step.y then row.wpBtn:Show() else row.wpBtn:Hide() end
                end
                if row.trkBtn then row.trkBtn:Show() end
                row:Show()
            else
                row.stepIndex = nil
                row:Hide()
            end
        end
    end
    if UI.completeBtn then
        if e and ns.IsEntrySolved(e) then
            UI.completeBtn:SetText("Solved (click to unmark)")
        else
            UI.completeBtn:SetText("Mark whole secret solved")
        end
    end
    if UI.trackBtn then
        if e and ns.db and ns.db.tracked and ns.db.tracked.id == e.id then
            UI.trackBtn:SetText("Open tracker")
        else
            UI.trackBtn:SetText("Track this secret")
        end
    end
end

function UI.Select(id)
    state.selectedId = id
    state.stepOffset = 0
    UI.Refresh()
end

function UI.Toggle()
    if not state.built then UI.Build() end
    if not UI.frame then return end
    if UI.frame:IsShown() then UI.frame:Hide() else UI.frame:Show() UI.Refresh() end
end

function UI.Build()
    if state.built then return end
    local f = CreateFrame("Frame", "SecretsGPSFrame", UIParent, "BackdropTemplate")
    f:SetSize(940, 620)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetClampedToScreen(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", function(self) self:StartMoving() end)
    f:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    if f.SetBackdrop then
        f:SetBackdrop({
            bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 16, edgeSize = 16,
            insets = { left = 4, right = 4, top = 4, bottom = 4 },
        })
        f:SetBackdropColor(0, 0, 0, 0.93)
        f:SetBackdropBorderColor(0.42, 0.03, 0.03, 1)
    end
    f:Hide()
    UI.frame = f

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -12)
    title:SetText("|cffe5484dSecretsGPS|r - Hidden Secrets & Collectibles")
    local close = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    close:SetSize(24, 24)
    close:SetPoint("TOPRIGHT", -10, -10)
    close:SetText("X")
    close:SetScript("OnClick", function() f:Hide() end)

    local ms = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ms:SetPoint("TOPLEFT", 16, -38)
    ms:SetText("")
    UI.msText = ms

    local search = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    search:SetSize(300, 22)
    search:SetPoint("TOPLEFT", 16, -58)
    search:SetAutoFocus(false)
    search:SetScript("OnTextChanged", function(self)
        state.search = (self:GetText() or ""):lower()
        state.listOffset = 0
        UI.Refresh()
    end)
    search:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    UI.searchBox = search
    local searchLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    searchLabel:SetPoint("LEFT", search, "RIGHT", 8, 0)
    searchLabel:SetText("Search")

    local typeBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    typeBtn:SetSize(170, 22)
    typeBtn:SetPoint("TOPLEFT", 470, -58)
    typeBtn:SetText("Type: All")
    typeBtn:SetScript("OnClick", function()
        local types = { "all" }
        local seen = {}
        for i = 1, #ns.Entries do
            local t = ns.Entries[i].type
            if t and not seen[t] then seen[t] = true types[#types + 1] = t end
        end
        table.sort(types)
        local cur = (ns.db and ns.db.typeFilter) or "all"
        local nextIdx = 1
        for i = 1, #types do if types[i] == cur then nextIdx = i + 1 end end
        if nextIdx > #types then nextIdx = 1 end
        if ns.db then ns.db.typeFilter = types[nextIdx] end
        typeBtn:SetText("Type: " .. (types[nextIdx] == "all" and "All" or (TYPE_LABELS[types[nextIdx]] or types[nextIdx])))
        state.listOffset = 0
        UI.Refresh()
    end)
    UI.typeBtn = typeBtn

    local hideBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    hideBtn:SetSize(170, 22)
    hideBtn:SetPoint("TOPLEFT", 650, -58)
    hideBtn:SetText("Hide solved: Off")
    hideBtn:SetScript("OnClick", function()
        if ns.db then ns.db.hideCompleted = not ns.db.hideCompleted end
        hideBtn:SetText("Hide solved: " .. ((ns.db and ns.db.hideCompleted) and "On" or "Off"))
        state.listOffset = 0
        UI.Refresh()
    end)

    UI.listRows = {}
    for i = 1, LIST_ROWS do
        local b = CreateFrame("Button", nil, f)
        b:SetSize(300, 30)
        b:SetPoint("TOPLEFT", 16, -92 - (i - 1) * 32)
        local t = b:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        t:SetPoint("TOPLEFT", 4, -2)
        t:SetWidth(292)
        t:SetJustifyH("LEFT")
        local s = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        s:SetPoint("TOPLEFT", 4, -16)
        s:SetWidth(292)
        s:SetJustifyH("LEFT")
        b.text = t
        b.sub = s
        b:SetScript("OnClick", function(self)
            if self.entryId then UI.Select(self.entryId) end
        end)
        UI.listRows[i] = b
    end
    local listUp = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    listUp:SetSize(70, 20)
    listUp:SetPoint("TOPLEFT", 16, -92 - LIST_ROWS * 32 - 4)
    listUp:SetText("Up")
    listUp:SetScript("OnClick", function()
        state.listOffset = math.max(0, state.listOffset - LIST_ROWS)
        UI.Refresh()
    end)
    local listDown = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    listDown:SetSize(70, 20)
    listDown:SetPoint("LEFT", listUp, "RIGHT", 8, 0)
    listDown:SetText("Down")
    listDown:SetScript("OnClick", function()
        if state.listOffset + LIST_ROWS < #state.filtered then
            state.listOffset = state.listOffset + LIST_ROWS
            UI.Refresh()
        end
    end)

    local dn = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    dn:SetPoint("TOPLEFT", 340, -92)
    dn:SetWidth(570)
    dn:SetJustifyH("LEFT")
    UI.detailName = dn
    local dm = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    dm:SetPoint("TOPLEFT", 340, -118)
    dm:SetWidth(570)
    dm:SetJustifyH("LEFT")
    dm:SetJustifyV("TOP")
    dm:SetWordWrap(true)
    UI.detailMeta = dm

    UI.stepRows = {}
    for i = 1, STEP_ROWS do
        local b = CreateFrame("Button", nil, f)
        b:SetSize(540, 38)
        b:SetPoint("TOPLEFT", 340, -246 - (i - 1) * 40)
        local t = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        t:SetPoint("TOPLEFT", 2, -2)
        t:SetWidth(536)
        t:SetJustifyH("LEFT")
        t:SetJustifyV("TOP")
        t:SetWordWrap(true)
        b.text = t
        b:SetScript("OnClick", function(self)
            local e = SelectedEntry()
            if e and self.stepIndex then
                local step = e.steps[self.stepIndex]
                if step and step.questFlag and ns.IsQuestDone(step.questFlag) then
                    ns.Print("That step is already complete in-game (quest flag).")
                else
                    ns.ToggleStep(e, self.stepIndex)
                end
                UI.Refresh()
            end
        end)
        local wp = CreateFrame("Button", nil, b, "UIPanelButtonTemplate")
        wp:SetSize(34, 18)
        wp:SetPoint("BOTTOMRIGHT", -2, 0)
        wp:SetText("WP")
        wp:SetScript("OnClick", function()
            local e = SelectedEntry()
            if e and b.stepIndex and e.steps[b.stepIndex] then
                ns.SetWaypoint(e.steps[b.stepIndex], e.name)
            end
        end)
        b.wpBtn = wp
        local trk = CreateFrame("Button", nil, b, "UIPanelButtonTemplate")
        trk:SetSize(34, 18)
        trk:SetPoint("BOTTOMRIGHT", -40, 0)
        trk:SetText("Trk")
        trk:SetScript("OnClick", function()
            local e = SelectedEntry()
            if e and b.stepIndex and ns.Tracker then
                ns.Tracker.Start(e, b.stepIndex)
            end
        end)
        b.trkBtn = trk
        UI.stepRows[i] = b
    end
    local stepUp = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    stepUp:SetSize(70, 20)
    stepUp:SetPoint("TOPLEFT", 340, -246 - STEP_ROWS * 40 - 4)
    stepUp:SetText("Up")
    stepUp:SetScript("OnClick", function()
        state.stepOffset = math.max(0, state.stepOffset - STEP_ROWS)
        UI.Refresh()
    end)
    local stepDown = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    stepDown:SetSize(70, 20)
    stepDown:SetPoint("LEFT", stepUp, "RIGHT", 8, 0)
    stepDown:SetText("Down")
    stepDown:SetScript("OnClick", function()
        local e = SelectedEntry()
        if e and state.stepOffset + STEP_ROWS < #e.steps then
            state.stepOffset = state.stepOffset + STEP_ROWS
            UI.Refresh()
        end
    end)

    local complete = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    complete:SetSize(220, 22)
    complete:SetPoint("LEFT", stepDown, "RIGHT", 16, 0)
    complete:SetText("Mark whole secret solved")
    complete:SetScript("OnClick", function()
        local e = SelectedEntry()
        if e then ns.ToggleEntryComplete(e) UI.Refresh() end
    end)
    UI.completeBtn = complete

    local trackBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    trackBtn:SetSize(150, 22)
    trackBtn:SetPoint("LEFT", complete, "RIGHT", 8, 0)
    trackBtn:SetText("Track this secret")
    trackBtn:SetScript("OnClick", function()
        local e = SelectedEntry()
        if e and ns.Tracker then
            if ns.db and ns.db.tracked and ns.db.tracked.id == e.id then
                ns.Tracker.Toggle()
            else
                ns.Tracker.Start(e)
            end
        end
    end)
    UI.trackBtn = trackBtn

    local ds = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ds:SetPoint("BOTTOMLEFT", 340, 12)
    ds:SetWidth(570)
    ds:SetJustifyH("LEFT")
    UI.detailSource = ds

    local hint = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    hint:SetPoint("BOTTOMLEFT", 16, 12)
    hint:SetText("Click a step to tick it. WP = waypoint, Trk = track from this step. /sgps help")
    state.built = true
    UI.Refresh()
end
