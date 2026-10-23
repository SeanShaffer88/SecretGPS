-- SecretGPS: WoW: Forever exclusive secrets, part 3 (Lost WOW guides).
-- Facts transcribed only from the Lost WOW guides cited per entry.
-- All Forever entries must be re-verified on the live Nov 4 build.
local _, ns = ...
ns.Entries = ns.Entries or {}
local function Add(e) ns.Entries[#ns.Entries + 1] = e end

Add({
    id = "excitable-slime",
    name = "Excitable Slime",
    type = "pet",
    expansion = "forever",
    game = "forever",
    zone = "Undercity",
    reward = "Excitable Slime (companion pet)",
    solo = "Solo",
    status = "BETA-EARNED",
    source = "https://lostwow.com/ForeverCityPets.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Buy a Nutritious Slime Sludge from Boyle on the bridge to the Apothecarium in Undercity", zone = "Undercity", x = 56.2, y = 64.6 },
        { text = "Jump into the green water of the canal and find the small slime swimming in it", zone = "Undercity" },
        { text = "Use /dance at the slime until it reacts and offers the quest WRIGGLE", zone = "Undercity" },
        { text = "Hand over the sludge and the Excitable Slime joins you - /dance with it out and it dances along", zone = "Undercity" },
    },
})

Add({
    id = "baby-crocolisk",
    name = "Baby Crocolisk",
    type = "pet",
    expansion = "forever",
    game = "forever",
    zone = "Stormwind City",
    reward = "Baby Crocolisk (companion pet)",
    solo = "Raid group (beta)",
    status = "BETA-EARNED",
    source = "https://lostwow.com/ForeverCityPets.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "The Sewer Beast, the crocolisk of Stormwind legend, now patrols the city canals", zone = "Stormwind City" },
        { text = "In the beta it is a level 50 elite, so bring a raid group", zone = "Stormwind City" },
        { text = "It drops the Baby Crocolisk pet - the drop rate is not known yet", zone = "Stormwind City" },
    },
})

Add({
    id = "night-watchmans-torch",
    name = "Night Watchman's Torch",
    type = "toy",
    expansion = "forever",
    game = "forever",
    zone = "Duskwood",
    reward = "Night Watchman's Torch (toy, lightable every 30 seconds)",
    solo = "Solo",
    status = "BETA-EARNED",
    source = "https://lostwow.com/ForeverCityPets.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Behind the largest house in Raven Hill, next to the outhouse, a slain Night Watch guard sometimes lies on the ground - he is not always there, so check back", zone = "Duskwood (Raven Hill)" },
        { text = "Click him to start the quest An Unfortunate End", zone = "Duskwood (Raven Hill)" },
        { text = "Complete it for the Night Watchman's Torch toy", zone = "Duskwood (Raven Hill)" },
    },
})

Add({
    id = "graverobbers-shovel",
    name = "Graverobber's Shovel",
    type = "forever_item",
    expansion = "forever",
    game = "forever",
    zone = "The Stockade / Duskwood / Tirisfal Glades",
    reward = "Graverobber's Shovel (two-hand mace) - and whatever its graves contain (undocumented)",
    solo = "Solo / group for the Stockade farm",
    difficulty = 4,
    rng = "About 0.5% drop per Wowhead (via Lost WOW)",
    status = "BETA-PARTLY-SOLVED",
    source = "https://lostwow.com/ForeverGraverobbersShovel.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Farm Dextren Ward in The Stockade - Wowhead lists the shovel as his drop at about 0.5%, so expect many runs", zone = "The Stockade" },
        { text = "The shovel itself: item level 28, requires level 23, +10 Stamina and +12 Attack Power (doubled against Undead)", zone = "The Stockade" },
        { text = "Use: Dig up a grave (20 charges, 2-minute cooldown) - usable at Raven Hill Cemetery in Duskwood", zone = "Duskwood (Raven Hill Cemetery)" },
        { text = "... and at the Scarlet Monastery Graveyard in Tirisfal Glades", zone = "Tirisfal Glades (Scarlet Monastery Graveyard)" },
        { text = "What the graves give is still undocumented - this is the open part of the secret", zone = "Duskwood / Tirisfal Glades" },
    },
})

Add({
    id = "lordaeron-secret-bosses",
    name = "Ruins of Lordaeron: Secret Bosses",
    type = "questline",
    expansion = "forever",
    game = "forever",
    zone = "Ruins of Lordaeron",
    reward = "The Abandoned's loot (incl. Scepter of the Abandoned, Rotmender's Leggings) and Viktor the Vile's loot; part of the Rotmender's Raiment set hunt",
    solo = "Small group is safer",
    status = "BETA-EARNED",
    source = "https://lostwow.com/ForeverRuinsOfLordaeron.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "The Abandoned: find the courtyard with the statue whose eyes glow; clear it and the tower next to it", zone = "Ruins of Lordaeron" },
        { text = "Step into the tower doorway - waves of undead come in, then the level 18 ghost The Abandoned descends", zone = "Ruins of Lordaeron" },
        { text = "His loot includes Grip of Fear, the Scepter of the Abandoned (+24 spell damage), Wispcloth Leggings and Rotmender's Leggings", zone = "Ruins of Lordaeron" },
        { text = "Viktor the Vile: go to the burned house south-west of Lordamere Overlook and click the fireplace - five waves of undead attack, and Viktor comes with the sixth", zone = "Ruins of Lordaeron" },
        { text = "Viktor drops Bloody Chest Wraps and Vilewalker Boots", zone = "Ruins of Lordaeron" },
        { text = "Rotmender's Raiment hunt: The Abandoned drops the Leggings, Rath'mael in the same ruins drops the Treads; the robe, sash and gloves can be traded but nobody has found where they drop", zone = "Ruins of Lordaeron" },
    },
})

Add({
    id = "brother-zendraas",
    name = "Brother Zendraas (Windstone Vendor)",
    type = "vendor",
    expansion = "forever",
    game = "forever",
    zone = "Zephras Isle",
    reward = "24 pieces of Al'aketh cloth, leather and mail gear for Windstones",
    solo = "Solo",
    status = "BETA-EARNED",
    source = "https://lostwow.com/ForeverZendraas.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Go to the Shrine of Akir on Zephras Isle and talk to Brother Zendraas - the cultist-looking figure is a friendly vendor", zone = "Zephras Isle", x = 57.8, y = 52.0 },
        { text = "Go through his dialogue before his shop opens - sometimes it takes a second try", zone = "Zephras Isle" },
        { text = "He sells 24 pieces of Al'aketh gear for 5, 8 or 15 Windstones each", zone = "Zephras Isle" },
        { text = "Windstones lie on the ground around Zephras Isle and drop from its creatures; they are not soulbound, so you can mail them to another character", zone = "Zephras Isle" },
    },
})

Add({
    id = "silver-of-the-waves",
    name = "Silver of the Waves",
    type = "questline",
    expansion = "forever",
    game = "forever",
    zone = "Loch Modan",
    reward = "Repurposed Hair Band (cloth wrists, +2 Intellect, +2 Spirit) and experience",
    solo = "Solo",
    prereq = "Alliance",
    status = "BETA-EARNED",
    source = "https://lostwow.com/ForeverHiddenQuests.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "A Discarded Fishing Toolbox lies on the bottom of the lake in Loch Modan - the spot can vary a little", zone = "Loch Modan", x = 45.6, y = 43.4 },
        { text = "Inside is a Monogrammed Silver Hair Clip engraved K.D.", zone = "Loch Modan" },
        { text = "Bring it to Khara Deepwater, the fishing supplies vendor", zone = "Loch Modan", x = 39.5, y = 39.2 },
    },
})

Add({
    id = "whispering-horror-residue",
    name = "Whispering Horror Residue",
    type = "questline",
    expansion = "forever",
    game = "forever",
    zone = "Tirisfal Glades",
    reward = "Hidden quest for Undercity reputation",
    solo = "Solo",
    status = "BETA-EARNED",
    source = "https://lostwow.com/ForeverHiddenQuests.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Under the ruined house in Shadowvale is a cellar entrance", zone = "Tirisfal Glades (Shadowvale)" },
        { text = "Inside, the level 11 elite Whispering Horror drops the Whispering Horror Residue, which starts a quest", zone = "Tirisfal Glades (Shadowvale)" },
        { text = "Bring it to Father Lankester in the War Quarter of Undercity", zone = "Undercity" },
        { text = "The same cellar holds more small quests: As Above So Below, That Shadowvale Green Elixir, The One That Got Away (a crystal to the left by the kegs) and Making Repairs", zone = "Tirisfal Glades (Shadowvale)" },
    },
})

Add({
    id = "malignant-root",
    name = "Malignant Root",
    type = "questline",
    expansion = "forever",
    game = "forever",
    zone = "Wetlands",
    reward = "Malignant Root ring (no level requirement: +7 Stamina, +8 Attack Power, +spell power)",
    solo = "Solo",
    prereq = "Alliance - Rethiel is hostile to the Horde; one per character",
    status = "BETA-EARNED",
    source = "https://lostwow.com/ForeverHiddenQuests.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Find the elite Nightveiled Rotheap that patrols the Wetlands - kite it rather than fighting it in melee", zone = "Wetlands" },
        { text = "Loot the Rotheap Innards", zone = "Wetlands" },
        { text = "Trade them to Rethiel the Greenwarden", zone = "Wetlands", x = 56.2, y = 40.4 },
        { text = "Reward: the Malignant Root ring - one per character", zone = "Wetlands" },
    },
})

Add({
    id = "the-drunken-dwarf",
    name = "The Drunken Dwarf (Hidden Tavern)",
    type = "questline",
    expansion = "forever",
    game = "forever",
    zone = "Dun Algaz",
    reward = "A hidden tavern: unique food and a slow-fall ale; its locked cellar is unsolved",
    solo = "Solo",
    status = "BETA-PARTLY-SOLVED",
    source = "https://lostwow.com/ForeverDrunkenDwarf.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Follow the road through the Dun Algaz tunnels to the orc camp", zone = "Dun Algaz" },
        { text = "Climb the mountain from there - start climbing earlier than feels right, then drop down towards a tree; the tavern is at about 53.0, 79.6", zone = "Dun Algaz", x = 53.0, y = 79.6 },
        { text = "Inside: a rested area run by the owner Agriel Firebrew, with a chef and a bartender - but no innkeeper, so you cannot set your hearthstone here", zone = "Dun Algaz" },
        { text = "It sells food you cannot buy anywhere else, including kimchi, and a slow-fall ale - the ale is the easy way back down the mountain", zone = "Dun Algaz" },
        { text = "At the back is a cellar door that cannot be clicked; players expect it to open in a later build (a files-only Half-Pint Tavern instance map was found and removed again in the Oct 1 build, with nothing connecting it to this door yet)", zone = "Dun Algaz" },
    },
})

for i = 1, #ns.Entries do
    local e = ns.Entries[i]
    if e.id == "musical-gustjumper" then
        table.insert(e.steps, { text = "Coordinate note: Lost WOW lists the frog choir at 51.5, 72.3 while wowdb.wiki said 51.5, 72.1 - check both spots on the live build", zone = "Zephras Isle", x = 51.5, y = 72.3 })
    end
end
