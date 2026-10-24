-- SecretGPS - Waypoints
-- Leads the player to a step. Providers, chosen with /sgps wp:
--   auto   - TomTom if it is installed, otherwise the native pin
--   tomtom - always TomTom (falls back to native if TomTom is absent)
--   native - always Blizzard's native map waypoint
-- The native path uses C_Map.SetUserWaypoint + super-tracking and
-- needs a verified mapID. TomTom waypoints also need a mapID. Steps
-- whose source guide gave zone + coordinates but no mapID fall back
-- to a printed /way line the player can paste into TomTom.
-- SecretGPS never bundles TomTom code; it only calls its public
-- AddWaypoint API when TomTom is already installed.
local _, ns = ...

-- Zone name -> uiMapID for Retail steps that carry coordinates but
-- no mapID of their own, so they still get a one-click pin. Every
-- ID is the primary Retail zone row of the game's UiMap table
-- (wago.tools DB2 export, 2026-10-23); ambiguous names (Eversong
-- Woods, Uldum) are left out on purpose. Retail only: the Forever
-- client's map IDs differ, so its steps keep the /way fallback.
-- The gate audits these IDs like any data-file mapID.
local ZONE_MAPS = {
    ["Abyssal Depths"] = 204, ["Ardenweald"] = 1565, ["Ashenvale"] = 63,
    ["Azj-Kahet"] = 2255, ["Azsuna"] = 630, ["Borean Tundra"] = 114,
    ["Boralus"] = 1161, ["Broken Shore"] = 646, ["City of Threads"] = 2213,
    ["Dazar'alor"] = 1165, ["Deadwind Pass"] = 42, ["Deepholm"] = 207,
    ["Dornogal"] = 2339, ["Drustvar"] = 896, ["Elwynn Forest"] = 37,
    ["Hallowfall"] = 2215, ["Highmountain"] = 650, ["Krokuun"] = 830,
    ["Kun-Lai Summit"] = 379, ["Maldraxxus"] = 1536, ["Nagrand (Outland)"] = 107,
    ["Nazjatar"] = 1355, ["Nazmir"] = 863, ["Northern Stranglethorn"] = 50,
    ["Shimmering Expanse"] = 205, ["Stormheim"] = 634, ["Stormsong Valley"] = 942,
    ["Suramar"] = 680, ["Thaldraszus"] = 2025, ["The Maw"] = 1543,
    ["The Storm Peaks"] = 120, ["Tiragarde Sound"] = 895, ["Undermine"] = 2346,
    ["Val'sharah"] = 641, ["Vol'dun"] = 864, ["Waking Shores"] = 2022,
    ["Westfall"] = 52, ["Winterspring"] = 83, ["Zangarmarsh"] = 102,
    ["Zereth Mortis"] = 1970, ["Zuldazar"] = 862,
}

-- Each TOC loads only its own game's catalog, so the first entry
-- tells which client this is.
local function IsRetailCatalog()
    local e = ns.Entries and ns.Entries[1]
    return e and e.game == "retail" or false
end

-- The step as a waypoint target: its own mapID when it has one,
-- otherwise the Retail zone table's. Returns nil without coordinates.
local function Resolve(step)
    if not step or not step.x or not step.y then return nil end
    if step.mapID then return step end
    local id = IsRetailCatalog() and ZONE_MAPS[step.zone or ""]
    if not id then return step end
    return { mapID = id, x = step.x, y = step.y, zone = step.zone, text = step.text }
end
ns.ResolveWaypointStep = Resolve

local function WayString(step)
    if not step or not step.x or not step.y then return nil end
    if step.mapID then
        return "/way #" .. step.mapID .. " " .. step.x .. " " .. step.y
    end
    if step.zone then
        return "/way " .. step.zone .. " " .. step.x .. " " .. step.y
    end
    return "/way " .. step.x .. " " .. step.y
end
ns.WayString = WayString

local function TomTomAvailable()
    return type(TomTom) == "table" and type(TomTom.AddWaypoint) == "function"
end
ns.TomTomAvailable = TomTomAvailable

local function Provider()
    local p = ns.db and ns.db.settings and ns.db.settings.wpProvider
    if p == "tomtom" or p == "native" then return p end
    return "auto"
end
ns.WaypointProvider = Provider

local function SetTomTomWaypoint(step, entryName)
    local ok = pcall(function()
        TomTom:AddWaypoint(step.mapID, step.x / 100, step.y / 100, {
            title = tostring(entryName or "SecretGPS step"),
            from = "SecretGPS",
            persistent = false,
        })
    end)
    if ok then
        ns.Print("TomTom waypoint set for " .. tostring(entryName or "step") ..
            ": " .. tostring(WayString(step)))
        return true
    end
    return false
end

local function SetNativeWaypoint(step, entryName)
    if not (C_Map and C_Map.SetUserWaypoint and UiMapPoint and UiMapPoint.CreateFromCoordinates) then
        return false
    end
    local ok = pcall(function()
        local point = UiMapPoint.CreateFromCoordinates(step.mapID, step.x / 100, step.y / 100)
        C_Map.SetUserWaypoint(point)
        if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
            C_SuperTrack.SetSuperTrackedUserWaypoint(true)
        end
    end)
    if ok then
        ns.Print("Waypoint set for " .. tostring(entryName or "step") ..
            ": " .. tostring(WayString(step)))
        return true
    end
    return false
end

local function SetWaypoint(step, entryName)
    if not step or not step.x or not step.y then
        ns.Print("This step has no published coordinates in its source guide.")
        return false
    end
    step = Resolve(step)
    if step.mapID then
        local provider = Provider()
        if provider == "tomtom" or (provider == "auto" and TomTomAvailable()) then
            if TomTomAvailable() and SetTomTomWaypoint(step, entryName) then
                return true
            end
            if provider == "tomtom" then
                ns.Print("TomTom is not available - using the native waypoint instead.")
            end
        end
        if SetNativeWaypoint(step, entryName) then
            return true
        end
    end
    local way = WayString(step)
    if way then
        ns.Print("Paste into TomTom: " .. way)
    end
    return false
end
ns.SetWaypoint = SetWaypoint
