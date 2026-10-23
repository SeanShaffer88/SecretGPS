-- SecretGPS - Core
-- A categorized catalog of hidden collectibles and secrets for
-- World of Warcraft Retail (12.1.5) and WoW: Forever (Camelot).
-- Pick a secret, follow its steps, set waypoints, track progress.
-- Original code, MIT. No combat data, no secret values, no automation:
-- navigation and checklist display only.
local ADDON, ns = ...

ns.VERSION = "0.5.0"
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

local function EnsureDB()
    if type(SecretGPSDB) ~= "table" then SecretGPSDB = {} end
    local db = SecretGPSDB
    if type(db.manualSteps) ~= "table" then db.manualSteps = {} end
    if type(db.manualComplete) ~= "table" then db.manualComplete = {} end
    if type(db.settings) ~= "table" then db.settings = {} end
    if db.settings.wpProvider == nil then db.settings.wpProvider = "auto" end
    if type(db.tracked) ~= "table" then db.tracked = nil end
    if db.hideCompleted == nil then db.hideCompleted = false end
    if db.typeFilter == nil then db.typeFilter = "all" end
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
    elseif cmd == "mindseeker" or cmd == "ms" then
        if ns.MindSeekerSummary then Print(ns.MindSeekerSummary()) end
    elseif cmd == "reset" then
        EnsureDB()
        ns.db.manualSteps = {}
        ns.db.manualComplete = {}
        Print("manual progress cleared (quest-flag progress is read from the game and is unaffected).")
        if ns.UI and ns.UI.Refresh then ns.UI.Refresh() end
    elseif cmd == "help" then
        Print("Commands: /sgps - toggle catalog | /sgps track - show/hide the SecretTracker | /sgps untrack - stop tracking | /sgps wp auto|native|tomtom - waypoint provider | /sgps mindseeker - Mind-Seeker progress | /sgps debug - diagnostics | /sgps reset - clear manual ticks | /sgps help")
    else
        if ns.UI and ns.UI.Toggle then ns.UI.Toggle() end
    end
end

local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:RegisterEvent("PLAYER_LOGIN")
loader:RegisterEvent("QUEST_LOG_UPDATE")
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
    elseif event == "QUEST_LOG_UPDATE" then
        if ns.Tracker and ns.Tracker.OnQuestUpdate then ns.Tracker.OnQuestUpdate() end
        if ns.UI and ns.UI.frame and ns.UI.frame:IsShown() and ns.UI.Refresh then
            ns.UI.Refresh()
        end
    end
end)
