-- SecretGPS - Core
-- A categorized catalog of hidden collectibles and secrets for
-- World of Warcraft Retail (12.1.5) and WoW: Forever (Camelot).
-- Pick a secret, follow its steps, set waypoints, track progress.
-- Original code, MIT. No combat data, no secret values, no automation:
-- navigation and checklist display only.
local ADDON, ns = ...

ns.VERSION = "0.6.7"
ns.Entries = ns.Entries or {}
ns.ById = {}

local function Print(msg)
    local chat = DEFAULT_CHAT_FRAME
    if chat and chat.AddMessage then
        chat:AddMessage("|cffe5484dSecretGPS:|r " .. tostring(msg))
    end
end
ns.Print = Print

local function BuildIndex()
    ns.ById = {}
    for i = 1, #ns.Entries do
        local e = ns.Entries[i]
        if e and e.id then ns.ById[e.id] = e end
    end
end
ns.BuildIndex = BuildIndex

-- Shared window styling (SEAN's direction, 2026-10-23): every
-- SecretGPS window wears the classic quest log look - a dark frame,
-- a black list panel with gold titles, and parchment reading panels
-- with ink text, matching the reference frame SEAN supplied.
-- v0.6.1 built the parchment from the original QuestLogFrame book
-- tiles; SEAN's live screenshots showed that art does not tile at
-- these window sizes on the current client (black slabs on the
-- right edge, a giant emblem over the title, ink text unreadable
-- where a tile sat under it), so v0.6.2 builds the same look from
-- backdrop colors instead - no legacy art files involved.
-- CONTRACT: pass only frames created with BackdropTemplate (plain
-- frames have no SetBackdrop on modern Mainline / Forever); the
-- SetBackdrop presence check below enforces it at runtime.
-- Panel backgrounds use WHITE8x8, never UI-Tooltip-Background:
-- that texture is grey and translucent, so in v0.6.2 it greyed the
-- parchment and veiled the detail title/meta drawn under the panel
-- (SEAN's live screenshot). WHITE8x8 is opaque, so the tint IS the
-- color. Texts that live on a panel are parented TO the panel, so
-- they always draw above it.
function ns.StyleQuestLog(frame)
    if not frame or not frame.SetBackdrop then return end
    frame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetBackdropColor(0.08, 0.065, 0.05, 0.97)
    frame:SetBackdropBorderColor(0.5, 0.4, 0.22, 1)
end

-- Inset panel in the same look: parchment (reading surfaces) or
-- black (list surfaces). Same BackdropTemplate contract as above.
function ns.StylePanel(frame, parchment)
    if not frame or not frame.SetBackdrop then return end
    frame:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    if parchment then
        frame:SetBackdropColor(0.93, 0.86, 0.68, 1)
        frame:SetBackdropBorderColor(0.4, 0.26, 0.1, 1)
    else
        frame:SetBackdropColor(0, 0, 0, 0.6)
        frame:SetBackdropBorderColor(0.35, 0.3, 0.22, 1)
    end
end

-- SavedVariables schema version (A9). Bump DB_VERSION when the
-- saved shape changes and add the migration step in MigrateDB; a
-- save written by a NEWER version is left untouched, never
-- downgraded or re-stamped.
local DB_VERSION = 1
local function MigrateDB(db)
    local v = db.version
    if type(v) ~= "number" then v = 0 end
    if v > DB_VERSION then return end
    -- v0 -> v1: the first versioned shape is the shape EnsureDB's
    -- defaults already produce, so this step is only the stamp.
    -- Future steps transform the data between the stamp updates.
    db.version = DB_VERSION
end

local function EnsureDB()
    if type(SecretGPSDB) ~= "table" then SecretGPSDB = {} end
    local db = SecretGPSDB
    if type(db.manualSteps) ~= "table" then db.manualSteps = {} end
    if type(db.manualComplete) ~= "table" then db.manualComplete = {} end
    if type(db.settings) ~= "table" then db.settings = {} end
    if db.settings.wpProvider == nil then db.settings.wpProvider = "auto" end
    if type(db.settings.textScale) ~= "number" then db.settings.textScale = 1.2 end
    if type(db.tracked) ~= "table" then db.tracked = nil end
    if db.hideCompleted == nil then db.hideCompleted = false end
    if db.typeFilter == nil then db.typeFilter = "all" end
    MigrateDB(db)
    ns.db = db
end
ns.EnsureDB = EnsureDB

local function Debug()
    local n = #ns.Entries
    local retail, forever = 0, 0
    for i = 1, n do
        if ns.Entries[i].game == "forever" then forever = forever + 1 else retail = retail + 1 end
    end
    Print("version " .. ns.VERSION .. " | entries=" .. n ..
        " (retail=" .. retail .. ", forever=" .. forever .. ")")
    local build = "unknown"
    if GetBuildInfo then
        local v, b = GetBuildInfo()
        build = tostring(v) .. " (" .. tostring(b) .. ")"
    end
    Print("client build: " .. build)
    if C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted then
        Print("quest-flag API: C_QuestLog.IsQuestFlaggedCompleted available")
    else
        Print("quest-flag API: C_QuestLog.IsQuestFlaggedCompleted NOT available")
    end
    if C_Map and C_Map.SetUserWaypoint and UiMapPoint then
        Print("waypoint API: C_Map.SetUserWaypoint available")
    else
        Print("waypoint API: native waypoints NOT available, /way text fallback active")
    end
end
ns.Debug = Debug

local function SlashHandler(msg)
    local cmd, rest = "", ""
    if type(msg) == "string" then
        cmd = (msg:match("^%s*(%S+)") or ""):lower()
        rest = (msg:match("^%s*%S+%s+(.-)%s*$") or ""):lower()
    end
    if cmd == "debug" then
        Debug()
    elseif cmd == "track" then
        if ns.Tracker then ns.Tracker.Toggle() end
    elseif cmd == "untrack" or cmd == "stoptrack" then
        if ns.Tracker then ns.Tracker.Stop() end
    elseif cmd == "wp" then
        EnsureDB()
        if rest == "auto" or rest == "native" or rest == "tomtom" then
            ns.db.settings.wpProvider = rest
            Print("waypoint provider set to " .. rest .. ".")
        else
            Print("waypoint provider: " .. ns.WaypointProvider() ..
                (ns.TomTomAvailable() and " (TomTom detected)" or " (TomTom not detected)") ..
                " - change with /sgps wp auto|native|tomtom")
        end
    elseif cmd == "pinall" then
        local e = ns.UI and ns.UI.SelectedEntry and ns.UI.SelectedEntry()
        if not e and ns.Tracker and ns.Tracker.Current then e = ns.Tracker.Current() end
        if e then ns.PinAllRemaining(e) else Print("Select or track a secret first.") end
    elseif cmd == "text" then
        if ns.UI and ns.UI.CycleTextScale then ns.UI.CycleTextScale() end
    elseif cmd == "mindseeker" or cmd == "ms" then
        if ns.MindSeekerSummary then Print(ns.MindSeekerSummary()) end
    elseif cmd == "reset" then
        EnsureDB()
        ns.db.manualSteps = {}
        ns.db.manualComplete = {}
        Print("manual progress cleared (quest-flag progress is read from the game and is unaffected).")
        if ns.UI and ns.UI.Refresh then ns.UI.Refresh() end
    elseif cmd == "help" then
        Print("Commands: /sgps - toggle catalog | /sgps track - show/hide the SecretTracker | /sgps untrack - stop tracking | /sgps wp auto|native|tomtom - waypoint provider | /sgps pinall - TomTom pins for every unfinished step | /sgps text - cycle text size | /sgps mindseeker - Mind-Seeker progress | /sgps debug - diagnostics | /sgps reset - clear manual ticks | /sgps help")
    else
        if ns.UI and ns.UI.Toggle then ns.UI.Toggle() end
    end
end

-- A5: QUEST_LOG_UPDATE can fire in bursts; coalesce catalog
-- refreshes through a short timer when C_Timer exists, and refresh
-- immediately where it does not (older clients, the test harness).
local qluPending = false
local function RefreshCatalogSoon()
    if not (ns.UI and ns.UI.frame and ns.UI.frame:IsShown()
        and ns.UI.Refresh) then return end
    if C_Timer and C_Timer.After then
        if qluPending then return end
        qluPending = true
        C_Timer.After(0.3, function()
            qluPending = false
            if ns.UI and ns.UI.frame and ns.UI.frame:IsShown()
                and ns.UI.Refresh then
                ns.UI.Refresh()
            end
        end)
    else
        ns.UI.Refresh()
    end
end

local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:RegisterEvent("PLAYER_LOGIN")
loader:RegisterEvent("QUEST_LOG_UPDATE")
-- Learning a mount, pet or toy can solve a secret on the spot
-- (collection detection), so these refresh exactly like a quest
-- update. Registration is pcall-guarded: a client without one of
-- these events errors on RegisterEvent rather than ignoring it.
local COLLECTION_EVENTS = { NEW_MOUNT_ADDED = true, NEW_PET_ADDED = true, NEW_TOY_ADDED = true }
for ev in pairs(COLLECTION_EVENTS) do
    pcall(loader.RegisterEvent, loader, ev)
end
loader:SetScript("OnEvent", function(_, event, arg1)
    if event == "ADDON_LOADED" and arg1 == ADDON then
        EnsureDB()
        BuildIndex()
    elseif event == "PLAYER_LOGIN" then
        EnsureDB()
        BuildIndex()
        SLASH_SECRETSGPS1 = "/secretgps"
        SLASH_SECRETSGPS2 = "/sgps"
        SLASH_SECRETSGPS3 = "/sa"
        SlashCmdList["SECRETSGPS"] = SlashHandler
        if ns.UI and ns.UI.Build then ns.UI.Build() end
        if ns.Tracker and ns.Tracker.Restore then ns.Tracker.Restore() end
        Print("loaded v" .. ns.VERSION .. " - " .. #ns.Entries .. " secrets catalogued. /sgps to open.")
    elseif event == "QUEST_LOG_UPDATE" or COLLECTION_EVENTS[event] then
        if ns.Tracker and ns.Tracker.OnQuestUpdate then ns.Tracker.OnQuestUpdate() end
        RefreshCatalogSoon()
    end
end)
