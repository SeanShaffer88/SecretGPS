-- SecretGPS - UI
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
    housing = "Housing", forever_item = "Forever Item",
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
        if not hay:find(state.search, 1, true) then
            -- A4: also search inside the steps, so a word like
            -- "satchel" or "brazier" finds the guide that uses it.
            local found = false
            if e.steps then
                for j = 1, #e.steps do
                    local s = e.steps[j]
                    local shay = (tostring(s.text or "") .. " " ..
                        tostring(s.zone or "")):lower()
                    if shay:find(state.search, 1, true) then found = true break end
                end
            end
            if not found then return false end
        end
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
UI.SelectedEntry = SelectedEntry

local function ShowTip(owner, title, body)
    if not (GameTooltip and GameTooltip.SetOwner) then return end
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    if title then GameTooltip:AddLine(title) end
    if body then GameTooltip:AddLine(body, 0.85, 0.85, 0.85, true) end
    GameTooltip:Show()
end

local function HideTip()
    if GameTooltip and GameTooltip.Hide then GameTooltip:Hide() end
end

local function ScrollList(n)
    local maxOff = math.max(0, #state.filtered - LIST_ROWS)
    state.listOffset = math.min(maxOff, math.max(0, state.listOffset + n))
    UI.Refresh()
end

local function ScrollSteps(n)
    local e = SelectedEntry()
    if not e or not e.steps then return end
    local maxOff = math.max(0, #e.steps - STEP_ROWS)
    state.stepOffset = math.min(maxOff, math.max(0, state.stepOffset + n))
    UI.Refresh()
end

local function MetaText(e)
    local lines = {}
    lines[#lines + 1] = EntryTypeLabel(e) .. "  |  " ..
        (EXPANSION_LABELS[e.expansion] or tostring(e.expansion or "")) ..
        (e.mindSeeker and "  |  Mind-Seeker secret" or "")
    lines[#lines + 1] = "Reward: " .. tostring(e.reward or "-")
    if ns.IsCollected and ns.IsCollected(e) then
        lines[#lines + 1] = "Collected: already in your journal - this secret counts as solved."
    end
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
    if UI.typeBtn then
        local tf = (ns.db and ns.db.typeFilter) or "all"
        UI.typeBtn:SetText("Type: " .. (tf == "all" and "All" or (TYPE_LABELS[tf] or tf)))
    end
    for i = 1, LIST_ROWS do
        local row = UI.listRows[i]
        local e = state.filtered[state.listOffset + i]
        if row then
            if e then
                local done, total = ns.EntryStepProgress(e)
                local mark = ns.IsEntrySolved(e) and "|cff7dff7d[done]|r " or ""
                local tmark = (ns.cdb and ns.cdb.tracked and ns.cdb.tracked.id == e.id) and "|cffe5484d>> |r" or ""
                row.text:SetText(tmark .. mark .. tostring(e.name))
                row.sub:SetText(EntryTypeLabel(e) .. " - " ..
                    (EXPANSION_LABELS[e.expansion] or "") .. "  " .. done .. "/" .. total)
                row.entryId = e.id
                if row.hl then
                    if e.id == state.selectedId then row.hl:Show() else row.hl:Hide() end
                end
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
                local box = ns.IsStepDone(e, idx) and "|cff1d7a1d[x]|r" or "[ ]"
                local wp = (step.x and step.y) and "  |cff2050c8[WP]|r" or ""
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
        if e and ns.cdb and ns.cdb.tracked and ns.cdb.tracked.id == e.id then
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

-- Text size (SEAN, 2026-10-23: the guide text read small). The
-- setting scales the two addon windows, so text, layout and
-- buttons grow together and nothing can overlap at any size.
-- Default 1.2 - one step larger than the game's own panels.
local TEXT_SCALES = { 1.0, 1.1, 1.2, 1.3, 1.45 }

local function CurrentTextScale()
    local s = ns.db and ns.db.settings and ns.db.settings.textScale
    if type(s) ~= "number" then return 1.2 end
    return s
end

function UI.ApplyTextScale()
    local s = CurrentTextScale()
    if UI.frame and UI.frame.SetScale then UI.frame:SetScale(s) end
    if UI.textBtn then
        UI.textBtn:SetText("Text: " .. math.floor(s * 100 + 0.5) .. "%")
    end
    if ns.Tracker and ns.Tracker.SetScale then ns.Tracker.SetScale(s) end
end

function UI.CycleTextScale()
    if not state.built then UI.Build() end
    local cur = CurrentTextScale()
    local idx = 1
    for i = 1, #TEXT_SCALES do
        if math.abs(TEXT_SCALES[i] - cur) < 0.01 then
            idx = i
            break
        end
    end
    local nxt = TEXT_SCALES[idx % #TEXT_SCALES + 1]
    if ns.db and ns.db.settings then ns.db.settings.textScale = nxt end
    UI.ApplyTextScale()
end

function UI.Build()
    if state.built then return end
    local f = CreateFrame("Frame", "SecretGPSFrame", UIParent, "BackdropTemplate")
    f:SetSize(940, 640)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetClampedToScreen(true)
    f:RegisterForDrag("LeftButton")
    if f.EnableMouseWheel then f:EnableMouseWheel(true) end
    f:SetScript("OnMouseWheel", function(_, delta)
        ScrollList(delta > 0 and -3 or 3)
    end)
    f:SetScript("OnDragStart", function(self) self:StartMoving() end)
    f:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    -- Classic quest log look (SEAN, 2026-10-23): dark frame via
    -- the shared helper; a black list panel and a parchment guide
    -- panel are laid out below.
    if ns.StyleQuestLog then ns.StyleQuestLog(f) end
    f:Hide()
    UI.frame = f

    -- Book medallion next to the title, echoing the classic frame.
    -- Item icons are core assets that resolve by path on every
    -- client (the old quest-log book icon path renders blank on the
    -- current one - SEAN's minimap screenshot, 2026-10-23).
    local emblem = f:CreateTexture(nil, "ARTWORK")
    emblem:SetSize(30, 30)
    emblem:SetPoint("TOPLEFT", 12, -8)
    emblem:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    if emblem.SetTexCoord then emblem:SetTexCoord(0.08, 0.92, 0.08, 0.92) end

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 50, -14)
    title:SetText("SecretGPS - Hidden Secrets & Collectibles")
    title:SetTextColor(1, 0.85, 0.4)
    local close = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    close:SetSize(24, 24)
    close:SetPoint("TOPRIGHT", -10, -10)
    close:SetText("X")
    close:SetScript("OnClick", function() f:Hide() end)
    close:SetScript("OnEnter", function(self)
        ShowTip(self, "Close", "The catalog reopens any time with /sgps.")
    end)
    close:SetScript("OnLeave", HideTip)

    local ms = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ms:SetPoint("TOPLEFT", 16, -48)
    ms:SetText("")
    ms:SetTextColor(0.85, 0.78, 0.6)
    UI.msText = ms

    local search = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    search:SetSize(300, 22)
    search:SetPoint("TOPLEFT", 16, -66)
    search:SetAutoFocus(false)
    search:SetScript("OnTextChanged", function(self)
        state.search = (self:GetText() or ""):lower()
        state.listOffset = 0
        UI.Refresh()
    end)
    search:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    search:SetScript("OnEnter", function(self)
        ShowTip(self, "Search",
            "Filter the catalog by name, zone, reward, type, or words inside a secret's steps. Clear the box to show everything again.")
    end)
    search:SetScript("OnLeave", HideTip)
    UI.searchBox = search
    local searchLabel = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    searchLabel:SetPoint("LEFT", search, "RIGHT", 8, 0)
    searchLabel:SetText("Search")
    searchLabel:SetTextColor(0.85, 0.78, 0.6)

    local ToggleTypeMenu -- forward-declared; defined with the menu below
    local typeBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    typeBtn:SetSize(170, 22)
    typeBtn:SetPoint("TOPLEFT", 470, -66)
    typeBtn:SetText("Type: All")
    typeBtn:SetScript("OnClick", function()
        if ToggleTypeMenu then ToggleTypeMenu() end
    end)
    typeBtn:SetScript("OnEnter", function(self)
        ShowTip(self, "Filter by type",
            "Choose which reward type the catalog shows: mounts, pets, toys and more, each with its count.")
    end)
    typeBtn:SetScript("OnLeave", HideTip)
    UI.typeBtn = typeBtn

    -- Type filter dropdown (A4): a small dark menu under the Type
    -- button, replacing click-to-cycle.
    local typeMenu = CreateFrame("Frame", nil, f, "BackdropTemplate")
    typeMenu:SetSize(186, 100)
    typeMenu:SetPoint("TOPLEFT", typeBtn, "BOTTOMLEFT", 0, -2)
    local fl = f.GetFrameLevel and f:GetFrameLevel()
    if type(fl) == "number" and typeMenu.SetFrameLevel then
        typeMenu:SetFrameLevel(fl + 30)
    end
    if typeMenu.SetBackdrop then
        typeMenu:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8x8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true, tileSize = 16, edgeSize = 12,
            insets = { left = 3, right = 3, top = 3, bottom = 3 },
        })
        typeMenu:SetBackdropColor(0.07, 0.06, 0.05, 0.98)
        typeMenu:SetBackdropBorderColor(0.5, 0.4, 0.22, 1)
    end
    typeMenu:Hide()
    UI.typeMenu = typeMenu
    UI.typeMenuRows = {}
    for i = 1, 16 do
        local r = CreateFrame("Button", nil, typeMenu)
        r:SetSize(174, 19)
        r:SetPoint("TOPLEFT", 6, -6 - (i - 1) * 20)
        local rt = r:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        rt:SetPoint("LEFT", 4, 0)
        rt:SetTextColor(0.92, 0.86, 0.7)
        r.text = rt
        local hov = r:CreateTexture(nil, "BACKGROUND")
        hov:SetAllPoints(r)
        hov:SetColorTexture(1, 0.85, 0.4, 0.15)
        hov:Hide()
        r.hov = hov
        r:SetScript("OnEnter", function(self) if self.hov then self.hov:Show() end end)
        r:SetScript("OnLeave", function(self) if self.hov then self.hov:Hide() end end)
        r:SetScript("OnClick", function(self)
            if self.typeValue and ns.db then ns.db.typeFilter = self.typeValue end
            state.listOffset = 0
            typeMenu:Hide()
            UI.Refresh()
        end)
        r:Hide()
        UI.typeMenuRows[i] = r
    end
    ToggleTypeMenu = function()
        if typeMenu:IsShown() then typeMenu:Hide() return end
        local counts, order = {}, {}
        for i = 1, #ns.Entries do
            local t = ns.Entries[i].type
            if t then
                if not counts[t] then order[#order + 1] = t end
                counts[t] = (counts[t] or 0) + 1
            end
        end
        table.sort(order, function(a, b)
            return (TYPE_LABELS[a] or a) < (TYPE_LABELS[b] or b)
        end)
        local cur = (ns.db and ns.db.typeFilter) or "all"
        local items = { { value = "all", label = "All types", count = #ns.Entries } }
        for i = 1, #order do
            items[#items + 1] = { value = order[i],
                label = TYPE_LABELS[order[i]] or order[i], count = counts[order[i]] }
        end
        for i = 1, #UI.typeMenuRows do
            local r, it = UI.typeMenuRows[i], items[i]
            if it then
                r.typeValue = it.value
                r.text:SetText((it.value == cur and ">> " or "     ") ..
                    it.label .. "  (" .. it.count .. ")")
                r:Show()
            else
                r:Hide()
            end
        end
        typeMenu:SetHeight(12 + #items * 20)
        typeMenu:Show()
    end
    if f.HookScript then
        f:HookScript("OnHide", function() typeMenu:Hide() end)
    end

    local hideBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    hideBtn:SetSize(170, 22)
    hideBtn:SetPoint("TOPLEFT", 650, -66)
    hideBtn:SetText("Hide solved: Off")
    hideBtn:SetScript("OnClick", function()
        if ns.db then ns.db.hideCompleted = not ns.db.hideCompleted end
        hideBtn:SetText("Hide solved: " .. ((ns.db and ns.db.hideCompleted) and "On" or "Off"))
        state.listOffset = 0
        UI.Refresh()
    end)
    hideBtn:SetScript("OnEnter", function(self)
        ShowTip(self, "Hide solved",
            "Hide the secrets you have already solved, so the list shows only what is left to find.")
    end)
    hideBtn:SetScript("OnLeave", HideTip)

    local textBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    textBtn:SetSize(94, 22)
    textBtn:SetPoint("TOPLEFT", 830, -66)
    textBtn:SetText("Text: 120%")
    textBtn:SetScript("OnClick", function() UI.CycleTextScale() end)
    textBtn:SetScript("OnEnter", function(self)
        ShowTip(self, "Text size",
            "Cycle the text size of the SecretGPS windows (the windows scale with the text, so nothing overlaps). Also: /sgps text")
    end)
    textBtn:SetScript("OnLeave", HideTip)
    UI.textBtn = textBtn

    -- List panel: black, like the classic frame's quest list.
    local listPanel = CreateFrame("Frame", nil, f, "BackdropTemplate")
    listPanel:SetPoint("TOPLEFT", 10, -94)
    listPanel:SetPoint("BOTTOMLEFT", 10, 30)
    listPanel:SetWidth(320)
    if ns.StylePanel then ns.StylePanel(listPanel, false) end

    UI.listRows = {}
    for i = 1, LIST_ROWS do
        local b = CreateFrame("Button", nil, f)
        b:SetSize(300, 30)
        b:SetPoint("TOPLEFT", 16, -100 - (i - 1) * 32)
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
        t:SetTextColor(1, 0.82, 0.25)
        s:SetTextColor(0.72, 0.7, 0.64)
        local hl = b:CreateTexture(nil, "BACKGROUND")
        hl:SetAllPoints(b)
        hl:SetColorTexture(0.9, 0.65, 0.2, 0.28)
        hl:Hide()
        b.hl = hl
        local hov = b:CreateTexture(nil, "BACKGROUND")
        hov:SetAllPoints(b)
        hov:SetColorTexture(1, 1, 1, 0.07)
        hov:Hide()
        b.hov = hov
        if b.EnableMouseWheel then b:EnableMouseWheel(true) end
        b:SetScript("OnMouseWheel", function(_, delta)
            ScrollList(delta > 0 and -3 or 3)
        end)
        b:SetScript("OnClick", function(self)
            if self.entryId then UI.Select(self.entryId) end
        end)
        b:SetScript("OnEnter", function(self)
            if self.hov then self.hov:Show() end
            local e = self.entryId and ns.ById and ns.ById[self.entryId]
            if e then
                ShowTip(self, tostring(e.name),
                    tostring(e.reward or "") .. "\nClick to open its step-by-step guide.")
            end
        end)
        b:SetScript("OnLeave", function(self)
            if self.hov then self.hov:Hide() end
            HideTip()
        end)
        UI.listRows[i] = b
    end
    local listUp = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    listUp:SetSize(70, 20)
    listUp:SetPoint("TOPLEFT", 16, -100 - LIST_ROWS * 32 - 4)
    listUp:SetText("Up")
    listUp:SetScript("OnClick", function()
        state.listOffset = math.max(0, state.listOffset - LIST_ROWS)
        UI.Refresh()
    end)
    listUp:SetScript("OnEnter", function(self)
        ShowTip(self, "Scroll up", "Show the previous page of secrets.")
    end)
    listUp:SetScript("OnLeave", HideTip)
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
    listDown:SetScript("OnEnter", function(self)
        ShowTip(self, "Scroll down", "Show the next page of secrets.")
    end)
    listDown:SetScript("OnLeave", HideTip)

    -- Detail panel: parchment, like the classic frame's quest
    -- page. The title and meta are parented TO the panel: regions
    -- of the window frame draw below child frames, which is how
    -- v0.6.2's translucent panel veiled them into ghosts.
    local detailPanel = CreateFrame("Frame", nil, f, "BackdropTemplate")
    detailPanel:SetPoint("TOPLEFT", 338, -94)
    detailPanel:SetPoint("BOTTOMRIGHT", -10, 30)
    if ns.StylePanel then ns.StylePanel(detailPanel, true) end

    local dn = detailPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    dn:SetPoint("TOPLEFT", 10, -8)
    dn:SetWidth(566)
    dn:SetJustifyH("LEFT")
    dn:SetTextColor(0.35, 0.08, 0.03)
    UI.detailName = dn
    local dm = detailPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    dm:SetPoint("TOPLEFT", 10, -34)
    dm:SetWidth(566)
    dm:SetJustifyH("LEFT")
    dm:SetJustifyV("TOP")
    dm:SetWordWrap(true)
    dm:SetTextColor(0.16, 0.11, 0.05)
    UI.detailMeta = dm

    UI.stepRows = {}
    for i = 1, STEP_ROWS do
        local b = CreateFrame("Button", nil, f)
        b:SetSize(540, 38)
        b:SetPoint("TOPLEFT", 348, -240 - (i - 1) * 38)
        local t = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        t:SetPoint("TOPLEFT", 2, -2)
        t:SetWidth(536)
        t:SetJustifyH("LEFT")
        t:SetJustifyV("TOP")
        t:SetWordWrap(true)
        t:SetTextColor(0.16, 0.11, 0.05)
        b.text = t
        local hov = b:CreateTexture(nil, "BACKGROUND")
        hov:SetAllPoints(b)
        hov:SetColorTexture(0.30, 0.20, 0.08, 0.08)
        hov:Hide()
        b.hov = hov
        if b.EnableMouseWheel then b:EnableMouseWheel(true) end
        b:SetScript("OnMouseWheel", function(_, delta)
            ScrollSteps(delta > 0 and -3 or 3)
        end)
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
        b:SetScript("OnEnter", function(self)
            if self.hov then self.hov:Show() end
            local e = SelectedEntry()
            local step = e and e.steps and self.stepIndex and e.steps[self.stepIndex]
            if step then
                local body = tostring(step.text)
                if step.questFlag then
                    body = body .. "\nThis step ticks itself when the game records it complete."
                else
                    body = body .. "\nClick to tick or untick this step."
                end
                if step.x and step.y then
                    body = body .. "\nWP sets its waypoint; Trk tracks from this step."
                end
                ShowTip(self, "Step " .. tostring(self.stepIndex), body)
            end
        end)
        b:SetScript("OnLeave", function(self)
            if self.hov then self.hov:Hide() end
            HideTip()
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
        wp:SetScript("OnEnter", function(self)
            ShowTip(self, "Set waypoint",
                "Send this step's coordinates to TomTom if it is installed, otherwise to Blizzard's native map pin. Change the behaviour with /sgps wp auto, native or tomtom.")
        end)
        wp:SetScript("OnLeave", HideTip)
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
        trk:SetScript("OnEnter", function(self)
            ShowTip(self, "Track from this step",
                "Open the Secret Tracker starting at this step - it keeps the step on screen and sets its waypoint.")
        end)
        trk:SetScript("OnLeave", HideTip)
        b.trkBtn = trk
        UI.stepRows[i] = b
    end
    local stepUp = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    stepUp:SetSize(70, 20)
    stepUp:SetPoint("TOPLEFT", 348, -240 - STEP_ROWS * 38 - 4)
    stepUp:SetText("Up")
    stepUp:SetScript("OnClick", function()
        state.stepOffset = math.max(0, state.stepOffset - STEP_ROWS)
        UI.Refresh()
    end)
    stepUp:SetScript("OnEnter", function(self)
        ShowTip(self, "Scroll up", "Show the previous page of steps.")
    end)
    stepUp:SetScript("OnLeave", HideTip)
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
    stepDown:SetScript("OnEnter", function(self)
        ShowTip(self, "Scroll down", "Show the next page of steps.")
    end)
    stepDown:SetScript("OnLeave", HideTip)

    local complete = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    complete:SetSize(160, 22)
    complete:SetPoint("LEFT", stepDown, "RIGHT", 16, 0)
    complete:SetText("Mark secret solved")
    complete:SetScript("OnClick", function()
        local e = SelectedEntry()
        if e then ns.ToggleEntryComplete(e) UI.Refresh() end
    end)
    complete:SetScript("OnEnter", function(self)
        ShowTip(self, "Mark whole secret solved",
            "Mark (or unmark) the selected secret as solved without ticking every step. Quest-flag progress is read from the game and is never changed by this.")
    end)
    complete:SetScript("OnLeave", HideTip)
    UI.completeBtn = complete

    local trackBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    trackBtn:SetSize(140, 22)
    trackBtn:SetPoint("LEFT", complete, "RIGHT", 8, 0)
    trackBtn:SetText("Track this secret")
    trackBtn:SetScript("OnClick", function()
        local e = SelectedEntry()
        if e and ns.Tracker then
            if ns.cdb and ns.cdb.tracked and ns.cdb.tracked.id == e.id then
                ns.Tracker.Toggle()
            else
                ns.Tracker.Start(e)
            end
        end
    end)
    trackBtn:SetScript("OnEnter", function(self)
        ShowTip(self, "Track this secret",
            "Open the Secret Tracker for the selected secret: a small window that walks you through its steps and sets each waypoint as you advance.")
    end)
    trackBtn:SetScript("OnLeave", HideTip)
    UI.trackBtn = trackBtn

    local pinAll = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    pinAll:SetSize(90, 22)
    pinAll:SetPoint("LEFT", trackBtn, "RIGHT", 8, 0)
    pinAll:SetText("Pin all")
    pinAll:SetScript("OnClick", function()
        local e = SelectedEntry()
        if e and ns.PinAllRemaining then ns.PinAllRemaining(e) end
    end)
    pinAll:SetScript("OnEnter", function(self)
        ShowTip(self, "Pin all",
            "Add a TomTom waypoint for every unfinished step of the selected secret that has coordinates - made for the long lists (crystals, books, spawn points). Needs TomTom.")
    end)
    pinAll:SetScript("OnLeave", HideTip)
    UI.pinAllBtn = pinAll

    local ds = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    ds:SetPoint("BOTTOMRIGHT", -16, 10)
    ds:SetWidth(430)
    ds:SetJustifyH("RIGHT")
    ds:SetTextColor(0.8, 0.72, 0.55)
    UI.detailSource = ds

    local hint = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    hint:SetPoint("BOTTOMLEFT", 16, 10)
    hint:SetWidth(470)
    hint:SetJustifyH("LEFT")
    hint:SetText("Click a step to tick it. WP = waypoint, Trk = track from this step.")
    hint:SetTextColor(0.8, 0.72, 0.55)

    -- Minimap button (A6): hand-rolled, no libraries. A book icon
    -- to match the window styling - an item icon, because item
    -- icons resolve by path on every client while the old
    -- quest-log book icon path renders blank on the current one
    -- (SEAN's screenshot, 2026-10-23). Left-click toggles the
    -- catalog, right-click toggles the tracker; drag it around the
    -- minimap ring - the angle is saved in db.settings.
    if Minimap then
        local mb = CreateFrame("Button", "SecretGPSMinimapButton", Minimap)
        mb:SetSize(32, 32)
        mb:SetFrameStrata("MEDIUM")
        local mfl = Minimap.GetFrameLevel and Minimap:GetFrameLevel()
        if type(mfl) == "number" and mb.SetFrameLevel then
            mb:SetFrameLevel(mfl + 5)
        end
        local ring = mb:CreateTexture(nil, "BACKGROUND")
        ring:SetSize(53, 53)
        ring:SetPoint("TOPLEFT", mb, "TOPLEFT", 0, 0)
        ring:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
        -- The tracking-border texture's ring artwork sits in the
        -- TOP-LEFT of its canvas (the rest is drop shadow), so a
        -- CENTER anchor puts the visible ring ~11 units up-left of
        -- the icon - SEAN's 2026-10-23 minimap crop showed the book
        -- hanging off the ring's lower-right. Anchoring the texture
        -- TOPLEFT to the button at its natural 53 size (the layout
        -- minimap-button libraries use) centers the artwork itself
        -- on the button, where the icon already sits.
        -- The icon draws ABOVE the ring (OVERLAY vs BACKGROUND):
        -- with the icon underneath, this client's tracking-border
        -- texture hides it - the button read as an empty ring in
        -- SEAN's screenshots even once the icon path was fixed.
        local icon = mb:CreateTexture(nil, "OVERLAY")
        icon:SetSize(24, 24)
        icon:SetPoint("CENTER", 0, 0)
        for _, path in ipairs({
            "Interface\\Icons\\INV_Misc_Book_09",
            "Interface\\Icons\\INV_Misc_Book_07",
            "Interface\\Icons\\INV_Misc_Book_04",
        }) do
            if icon:SetTexture(path) ~= false then break end
        end
        if icon.SetTexCoord then icon:SetTexCoord(0.08, 0.92, 0.08, 0.92) end
        -- Sit the button on the minimap's rim, whatever its size.
        local radius = 80
        if Minimap.GetWidth then
            local mw = Minimap:GetWidth()
            if type(mw) == "number" and mw > 0 then
                radius = math.max(68, math.min(88, mw / 2))
            end
        end
        local angle = (ns.db and ns.db.settings and
            ns.db.settings.minimapAngle) or math.rad(215)
        local function Place()
            mb:ClearAllPoints()
            mb:SetPoint("CENTER", Minimap, "CENTER",
                math.cos(angle) * radius, math.sin(angle) * radius)
        end
        Place()
        if mb.RegisterForClicks then
            mb:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        end
        mb:RegisterForDrag("LeftButton")
        -- Drag state lives in locals, not frame fields: a field read
        -- on a frame can hit __index fallbacks (test mocks) and read
        -- back truthy when unset.
        local dragging, dragMoved = false, false
        mb:SetScript("OnDragStart", function() dragging = true end)
        mb:SetScript("OnDragStop", function()
            dragging = false
            if ns.db and ns.db.settings then
                ns.db.settings.minimapAngle = angle
            end
        end)
        mb:SetScript("OnUpdate", function()
            if not dragging then return end
            if not (GetCursorPosition and Minimap.GetCenter) then return end
            local cx, cy = Minimap:GetCenter()
            local gx, gy = GetCursorPosition()
            local scale = (Minimap.GetEffectiveScale and
                Minimap:GetEffectiveScale()) or 1
            if not (cx and gx) then return end
            local na = math.atan2(gy / scale - cy, gx / scale - cx)
            if math.abs(na - angle) > 0.01 then dragMoved = true end
            angle = na
            Place()
        end)
        mb:SetScript("OnClick", function(_, button)
            if dragMoved then dragMoved = false return end
            if button == "RightButton" then
                if ns.Tracker then ns.Tracker.Toggle() end
            else
                UI.Toggle()
            end
        end)
        mb:SetScript("OnEnter", function(self)
            ShowTip(self, "SecretGPS",
                "Left-click: open the secrets catalog.\nRight-click: show or hide the Secret Tracker.\nDrag to move this button around the minimap.")
        end)
        mb:SetScript("OnLeave", HideTip)
        UI.minimapButton = mb
    end
    state.built = true
    UI.ApplyTextScale()
    UI.Refresh()
end
