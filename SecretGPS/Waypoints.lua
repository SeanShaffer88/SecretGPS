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
