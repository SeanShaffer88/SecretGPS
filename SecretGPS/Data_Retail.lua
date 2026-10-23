-- SecretGPS -- Retail data (MVP 25 set, Retail entries)
-- Transcribed from the 2026-10-23 research report. Coordinates, mapIDs and
-- quest IDs appear only where that report sourced them; steps without a
-- sourced coordinate carry no x/y/mapID.
local _, ns = ...
ns.Entries = ns.Entries or {}
local function Add(e) ns.Entries[#ns.Entries + 1] = e end

Add({
  id = "lucid-nightmare", name = "Lucid Nightmare", type = "mount",
  collection = { kind = "mount", id = 961 },
  expansion = "legion", game = "retail", zone = "Dalaran > Broken Isles > Deadwind Pass",
  reward = "Lucid Nightmare mount", mindSeeker = true,
  solo = "Solo", difficulty = 4, estTime = "2-5h",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://conquestcapped.com/guides/wow/lucid-nightmare/",
  verifiedPatch = "12.1.5",
  completion = { questFlags = {47826, 47837, 47841, 47850, 47852, 47863, 47881, 47885} },
  steps = {
    { text = "Click the Inconspicuous Note in Curiosities & Moore", zone = "Dalaran (Broken Isles)", x = 48.5, y = 57.5, questFlag = 47826 },
    { text = "Ulduar: solve the lever puzzle after XT-002, set levers per the note", zone = "Ulduar", questFlag = 47837 },
    { text = "Read the note at the Ahn'Qiraj entrance and solve its consume/riddle items", zone = "Ahn'Qiraj entrance", questFlag = 47841 },
    { text = "Read the Deepholm note in the Crumbling Depths", zone = "Deepholm", x = 58.2, y = 25.5, questFlag = 47850 },
    { text = "Gnomeregan: set the 10 numerical consoles using the code from the binary plaque", zone = "Gnomeregan", x = 37, y = 55, questFlag = 47852 },
    { text = "Val'sharah house: untangle the Nightmare Tumor circuit until all lines are blue", zone = "Val'sharah", x = 66.5, y = 36.0, questFlag = 47863 },
    { text = "Kun-Lai Tomb of Secrets urn, then Endless Halls: carry 5 colored orbs to matching runes, one at a time (maze is random per player)", zone = "Kun-Lai Summit", x = 53.3, y = 49.3, questFlag = 47881 },
    { text = "Loot Puzzler's Desire atop the bone pile in the Forgotten Crypt behind Karazhan", zone = "Deadwind Pass", x = 39.93, y = 73.92, questFlag = 47885 },
  },
})

Add({
  id = "riddlers-mind-worm", name = "Riddler's Mind-Worm", type = "mount",
  collection = { kind = "mount", id = 947 },
  expansion = "legion", game = "retail", zone = "Azeroth-wide",
  reward = "Riddler's Mind-Worm mount", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "1-2h",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://wowpedia.fandom.com/wiki/Riddle_of_the_Mind-Seekers",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Follow the Page clues keyed to WoW Chronicle Vol. 1 page art; find the page in the Shado-Pan Monastery area", zone = "Shado-Pan Monastery area", x = 34.6, y = 50.9 },
    { text = "Find the page at the base of the Uldum statue", zone = "Uldum", x = 76.4, y = 53.6 },
    { text = "Find the page at the border of the Well of Eternity (see source guide for the remaining pages)", zone = "Well of Eternity" },
    { text = "Open the Gift of the Mind-Seekers chest on the Westfall Longshore", zone = "Westfall", x = 30.5, y = 27.4 },
  },
})

Add({
  id = "kosumoth", name = "Kosumoth the Hungering", type = "mount",
  collection = { kind = "mount", id = 838 },
  expansion = "legion", game = "retail", zone = "Broken Shore > Broken Isles",
  reward = "Fathom Dweller mount / Hungering Claw pet (world quest reward rotates)", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "~1h",
  timeGate = nil, rng = "World quest reward rotates between the mount and the pet", prereq = nil,
  source = "https://warcraft-secrets.com/guides/legion-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Talk to Drak'thul and exhaust his dialogue", zone = "Broken Shore", x = 37, y = 71 },
    { text = "Hungering Orb 1 of 10 - click in exact order (another player clicking puts it on a 20-minute cooldown)", zone = "Azsuna", x = 37, y = 37 },
    { text = "Hungering Orb 2 of 10", zone = "Stormheim", x = 33, y = 75 },
    { text = "Hungering Orb 3 of 10", zone = "Val'sharah", x = 41, y = 80 },
    { text = "Hungering Orb 4 of 10", zone = "Broken Shore", x = 31, y = 76 },
    { text = "Hungering Orb 5 of 10", zone = "Azsuna", x = 59, y = 12 },
    { text = "Hungering Orb 6 of 10", zone = "Stormheim", x = 67, y = 14 },
    { text = "Hungering Orb 7 of 10", zone = "Highmountain", x = 52, y = 36 },
    { text = "Hungering Orb 8 of 10", zone = "Azsuna", x = 54, y = 26 },
    { text = "Hungering Orb 9 of 10", zone = "Broken Isles (world map)", x = 50, y = 91 },
    { text = "Return to Drak'thul and click the final orb to unlock the DANGER: Kosumoth the Hungering world quest", zone = "Broken Shore", x = 37, y = 71 },
  },
})

Add({
  id = "sun-darter-hatchling", name = "Sun Darter Hatchling", type = "pet",
  collection = { kind = "pet", id = 382 },
  expansion = "legion", game = "retail", zone = "Winterspring (Caverns of Consumption)",
  reward = "Sun Darter Hatchling pet", mindSeeker = true,
  solo = "Solo", difficulty = 4, estTime = "30-60m in cave (plus item prep)",
  timeGate = nil, rng = nil, prereq = "Gather all 16 required items first - progress inside is not saved",
  source = "https://www.wowhead.com/guide/sun-darter-hatchling-secret-pet",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Gather all 16 required items before entering (see source guide list)", zone = "Auction House / world" },
    { text = "Enter the Caverns of Consumption", zone = "Winterspring", x = 57, y = 16 },
    { text = "Use the 6 Major elemental protection potions to pass the fire and fel barriers", zone = "Caverns of Consumption" },
    { text = "Use Noggenfogger until you get skeleton form to pass the Diligent Watcher", zone = "Caverns of Consumption" },
    { text = "Use Scotty's Lucky Coin at the vines, then the stone/water buff at the blue barrier", zone = "Caverns of Consumption" },
    { text = "Use Dire Brew to pass the golem, then Ethereal Oil at the purple barrier", zone = "Caverns of Consumption" },
    { text = "Use Gordok Ogre Suit plus Winterfall Firewater for the Mark of the Second", zone = "Caverns of Consumption" },
    { text = "Use Pygmy Oil until gnome form to slip through the gate", zone = "Caverns of Consumption" },
    { text = "Bring out a Perky Pug in the Little Princess costume at the cube", zone = "Caverns of Consumption" },
    { text = "Cancel Firewater, use a Scroll of Intellect, and loot the Oddly-Colored Egg", zone = "Caverns of Consumption" },
  },
})

Add({
  id = "uuna", name = "Uuna's Secret Storyline", type = "questline",
  expansion = "legion", game = "retail", zone = "Antoran Wastes (Argus) > world tour",
  reward = "Uuna pet, upgraded through her storyline (required for Baa'l)", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "~1h tour (plus doll farm)",
  timeGate = nil, rng = "Uuna's Doll is a daily-lockout drop chance", prereq = nil,
  source = "https://warcraft-secrets.com/guides/uuna",
  verifiedPatch = "12.1.5",
  completion = { questFlags = {50098, 50099, 50100, 50101, 50102, 50103, 50104, 50105, 50106, 50107, 50108, 50109} },
  steps = {
    { text = "Farm the Call of the Devourer from Scavenger's Boneyard mobs", zone = "Antoran Wastes", mapID = 885, x = 52.0, y = 38.0 },
    { text = "Collect the Ur'zul Bone", zone = "Antoran Wastes", mapID = 885, x = 50.4, y = 56.1 },
    { text = "Collect the Imp Bone (cave entrance nearby)", zone = "Antoran Wastes", mapID = 885, x = 65.9, y = 19.4 },
    { text = "Collect the Fiend Bone", zone = "Antoran Wastes", mapID = 885, x = 52.4, y = 35.3 },
    { text = "Combine the Bone Effigy and summon The Many-Faced Devourer; loot Uuna's Doll", zone = "Antoran Wastes", mapID = 885, x = 54.8, y = 39.2 },
    { text = "Rescue Uuna's soul, then take her on the world tour: Gate of the Setting Sun (via bronze dragon to pre-invasion Vale)", zone = "Vale of Eternal Blossoms" },
    { text = "World tour: Suramar tower door and Dalaran, Krasus' Landing", zone = "Suramar / Dalaran" },
    { text = "World tour: Wyrmrest Temple in Dragonblight and the Nordrassil lake portal", zone = "Dragonblight / Mount Hyjal" },
    { text = "World tour: Mount Neverest summit and the Blackrock Mountain ramps", zone = "Kun-Lai Summit / Blackrock Mountain" },
    { text = "World tour: Karabor entrance in Draenor Shadowmoon - she gains her doll, wand and flower crown", zone = "Shadowmoon Valley (Draenor)" },
  },
})

Add({
  id = "baal", name = "Baa'l", type = "pet",
  collection = { kind = "pet", id = 2352 },
  expansion = "bfa", game = "retail", zone = "Kul Tiras / Zandalar > Frostfire Ridge",
  reward = "Baa'l pet", mindSeeker = true,
  solo = "Solo", difficulty = 4, estTime = "~2-3h",
  timeGate = nil, rng = nil, prereq = "Uuna's Secret Storyline complete (upgraded Uuna)",
  source = "https://wowpedia.fandom.com/wiki/Riddle_of_Baa'l",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Pebble chain step 1: read the Conspicuous Note atop the Heart of Darkness", zone = "Nazmir", x = 51, y = 59 },
    { text = "Pebble: at Drak'thul", zone = "Broken Shore", x = 37, y = 71 },
    { text = "Pebble: in the Boralus cave", zone = "Boralus", x = 44.7, y = 38.5 },
    { text = "Pebble: in the hills by Atal'Dazar", zone = "Zuldazar", x = 31, y = 35 },
    { text = "Pebble: in the Gol Osigr cave", zone = "Drustvar", x = 36, y = 53 },
    { text = "Pebble: at Darkwood Shoal", zone = "Vol'dun", x = 63, y = 21 },
    { text = "Pebble: on the north isle", zone = "Stormsong Valley", x = 68, y = 13 },
    { text = "Pebble: on the ship in fatigue water - bring swim buffs (continent map coordinates)", zone = "Fatigue water (continent map)", x = 54.5, y = 7.3 },
    { text = "Pebble: in the Boralus basement", zone = "Boralus", x = 37, y = 80 },
    { text = "Pebble: in the island cave", zone = "Drustvar", x = 17.1, y = 6.4 },
    { text = "Pebble: in the cave", zone = "Tiragarde Sound", x = 75.4, y = 70.6 },
    { text = "Pebble: at the waterfall", zone = "Tiragarde Sound", x = 80.2, y = 19.5 },
    { text = "Pebble: underwater", zone = "Tiragarde Sound", x = 10.0, y = 82.6 },
    { text = "Finale: summon upgraded Uuna near Baa'l so she weakens him, then win the pet battle", zone = "Frostfire Ridge" },
  },
})

Add({
  id = "waist-of-time", name = "Waist of Time", type = "transmog",
  expansion = "bfa", game = "retail", zone = "Azeroth-wide (continues from Baa'l)",
  reward = "Waist of Time cosmetic belt", mindSeeker = true,
  solo = "Solo", difficulty = 4, estTime = "Multi-hour",
  timeGate = nil, rng = nil, prereq = "Baa'l pebble chain (its steps 1-15) done first",
  source = "https://wowpedia.fandom.com/wiki/It%27s_a_Waist_of_Time",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Continue the Baa'l tracking chain at step 16 - clues are keyed to WoW Chronicle Vol. 2 and anagrams (per-step coordinates: see source guide)", zone = "Azeroth-wide" },
    { text = "Solve 'SEEK KNOWLEGE' and use the Lit Orb outside Skyreach", zone = "Skyreach (outside)" },
    { text = "Collect the 4 objects the clues point to, performing the emotes at each location", zone = "Azeroth-wide" },
    { text = "Complete the final sequence to earn the belt", zone = "Azeroth-wide" },
  },
})

Add({
  id = "jenafur", name = "Jenafur", type = "pet",
  collection = { kind = "pet", id = 2795 },
  expansion = "bfa", game = "retail", zone = "Ashenvale > Elwynn Forest > Return to Karazhan",
  reward = "Jenafur pet", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "~30m once known",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/jenafur",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Talk to Amara Lunastar", zone = "Ashenvale", x = 17.4, y = 49.3 },
    { text = "Click the Empty Dish in Donni Anthania's house", zone = "Elwynn Forest", x = 44.2, y = 53.1 },
    { text = "In Return to Karazhan, collect 8 foods: 2 Juicy Drumstick, 2 Marbled Steak, 2 Fishy Bits, 1 Meaty Morsel, 1 Slathered Rib (5-minute timers on held and placed food)", zone = "Return to Karazhan" },
    { text = "Arrange the food on the Opera Hall floor tiles in the musical-staff pattern from the source guide", zone = "Return to Karazhan, Opera Hall" },
    { text = "When Amara's Wish plays, click Jenafur", zone = "Return to Karazhan, Opera Hall" },
  },
})

Add({
  id = "long-forgotten-hippogryph", name = "Long-Forgotten Hippogryph", type = "mount",
  collection = { kind = "mount", id = 802 },
  expansion = "legion", game = "retail", zone = "Azsuna",
  reward = "Reins of the Long-Forgotten Hippogryph mount", mindSeeker = true,
  solo = "Solo (competitive race)", difficulty = 4, estTime = "Camp / race - respawn reported ~2-6h (community estimate)",
  timeGate = nil, rng = "First player to click 5 crystals in a cycle wins; one winner per cycle", prereq = nil,
  source = "https://wiki.gamedetectives.net/index.php?title=Long-Forgotten_Hippogryph&direction=next&oldid=8462&printable=yes",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Hunt Ephemeral Crystals (bright pink/purple) across Azsuna - there are 100+ possible spawn points and the full point list is NOT included in v0.1; use the source guide's list", zone = "Azsuna" },
    { text = "Be the first to click a crystal to start your cycle", zone = "Azsuna" },
    { text = "Click 5 crystals in total, all within 8 hours of your first click", zone = "Azsuna" },
    { text = "Clicking the 5th crystal despawns all of them and awards the mount - one winner per cycle", zone = "Azsuna" },
  },
})

Add({
  id = "the-hivemind", name = "The Hivemind", type = "mount",
  collection = { kind = "mount", id = 1025 },
  expansion = "bfa", game = "retail", zone = "Azeroth-wide > Court of Stars",
  reward = "The Hivemind mount (carries only your attuned group of 5)", mindSeeker = true,
  solo = "Group: exactly 5", difficulty = 5, estTime = "3-6h total",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/the-hivemind",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Buy the Talisman of True Treasure Tracking from Griftah and keep it equipped for every interaction", zone = "Griftah" },
    { text = "Follow the letter chain to the Blue Monocle - the letter tent is in Highmountain (remaining letters: old Karazhan, Razorfen Downs, Mount Hyjal/Aviana, Icecrown, Townlong)", zone = "Highmountain", x = 57, y = 27 },
    { text = "Green Monocle: solve the Skyreach console puzzle", zone = "Skyreach" },
    { text = "Yellow Monocle: solve the Halls of Origination constellation puzzle", zone = "Halls of Origination" },
    { text = "Red Monocle: complete Sir Finley's timed pet-supply grind in Vol'dun", zone = "Vol'dun" },
    { text = "Form a group of exactly 5 (one of each monocle plus one with none) and enter the Court of Stars sequence in Suramar", zone = "Suramar / Court of Stars" },
    { text = "Monocle wearers drop 4 NPCs to 1 HP at the same time to admit the 5th player; solve the Lost Cat Toy damage-code puzzle", zone = "Court of Stars" },
    { text = "Solve the platform and lava role puzzles (Driver / Child / Adult)", zone = "Court of Stars" },
    { text = "Final room: all 5 stand in the circles and channel at the same time to receive the mount", zone = "Court of Stars" },
  },
})

Add({
  id = "slime-serpent", name = "Slime Serpent", type = "mount",
  collection = { kind = "mount", id = 1445 },
  expansion = "shadowlands", game = "retail", zone = "Plaguefall (Maldraxxus)",
  reward = "Slime Serpent mount", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "~20m",
  timeGate = nil, rng = nil, prereq = "Must run Heroic or Mythic completely solo - being in a party at all invalidates it",
  source = "https://blizzardwatch.com/2021/04/19/slime-serpent-mount/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Enter Plaguefall on Heroic or Mythic with no party at all", zone = "Plaguefall" },
    { text = "Clear the dungeon solo, including the last two bosses and Margrave Stradama", zone = "Plaguefall" },
    { text = "Return to the Domina Venomblade platform and /pet the Curious Slime Serpent", zone = "Plaguefall" },
  },
})

Add({
  id = "hand-of-nilganihmaht", name = "Hand of Nilganihmaht", type = "mount",
  collection = { kind = "mount", id = 1503 },
  expansion = "shadowlands", game = "retail", zone = "The Maw (+ Rift phase)",
  reward = "Hand of Nilganihmaht mount", mindSeeker = true,
  solo = "Solo", difficulty = 4, estTime = "Multi-week possible",
  timeGate = "Some rings come from Covenant Assault quests, which rotate", rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/hand-of-nilganihmaht",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Collect the 5 rings: Stone Ring, Runed Band, Gold Band, Silver Ring, Signet Ring (sources include Maw quests, a Perdition Hold floor spawn, the Maw Mad Construct, and Covenant Assault quests)", zone = "The Maw" },
    { text = "Gold Band spot (nearby grapple point is at 18.9, 38.0)", zone = "The Maw", x = 19.2, y = 32.3 },
    { text = "Enter the Rift-phase cave", zone = "The Maw", mapID = 1543, x = 25.5, y = 32.6 },
    { text = "Place the 5 rings on the Hand and complete Gotta Hand It To Ya", zone = "The Maw", mapID = 1543, x = 25.5, y = 36.8 },
  },
})

Add({
  id = "sinrunner-blanchy", name = "Sinrunner Blanchy", type = "mount",
  collection = { kind = "mount", id = 1414 },
  expansion = "shadowlands", game = "retail", zone = "Revendreth",
  reward = "Sinrunner Blanchy mount", mindSeeker = true,
  solo = "Solo", difficulty = 2, estTime = "6 days (time-gated)",
  timeGate = "6 days", rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/shadowlands-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Find the dead Blanchy in Revendreth (exact spot: see source guide)", zone = "Revendreth" },
    { text = "Bring her the daily offering she asks for - offerings across the days include handfuls of oats, a water bucket and clean horseshoes (full list: see source guide)", zone = "Revendreth" },
    { text = "Repeat on 6 different days; on day 6 she returns as your mount", zone = "Revendreth" },
  },
})

Add({
  id = "wildseed-cradle", name = "Wildseed Cradle", type = "mount",
  collection = { kind = "mount", id = 1397 },
  expansion = "shadowlands", game = "retail", zone = "Ardenweald (Garden of Night)",
  reward = "Wildseed Cradle mount", mindSeeker = false,
  solo = "Solo", difficulty = 1, estTime = "~15m",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/shadowlands-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Collect Twinklestar's lost tool: the Diary", zone = "Ardenweald", x = 38.99, y = 56.96 },
    { text = "Collect the lost tool: the Hammer", zone = "Ardenweald", x = 39.75, y = 54.40 },
    { text = "Collect the lost tool: the Basket", zone = "Ardenweald", x = 40.31, y = 52.62 },
    { text = "Collect the lost tool: the Flute", zone = "Ardenweald", x = 38.49, y = 58.08 },
    { text = "Collect the lost tool: the Wand", zone = "Ardenweald", x = 38.85, y = 60.10 },
    { text = "The 5 tools combine into the Gardening Toolkit - return it to Twinklestar in Tirna Vaal", zone = "Ardenweald, Tirna Vaal" },
    { text = "With Moonsight, open the Cache of the Moon behind her for the mount", zone = "Ardenweald, Tirna Vaal" },
  },
})

Add({
  id = "shimmermist-runner", name = "Shimmermist Runner", type = "mount",
  collection = { kind = "mount", id = 1360 },
  expansion = "shadowlands", game = "retail", zone = "Ardenweald (Mistveil Tangle maze)",
  reward = "Shimmermist Runner mount", mindSeeker = false,
  solo = "Solo", difficulty = 2, estTime = "~10m",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://www.method.gg/guides/mounts/shimmermist-runner-mount-guide",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Enter the Mistveil Tangle maze (a wrong turn phases the end out - reset at the start)", zone = "Ardenweald", x = 31.04, y = 54.49 },
    { text = "Turn LEFT", zone = "Mistveil Tangle", x = 29.60, y = 55.76 },
    { text = "Turn RIGHT", zone = "Mistveil Tangle", x = 30.02, y = 57.49 },
    { text = "Turn LEFT", zone = "Mistveil Tangle", x = 29.56, y = 57.91 },
    { text = "Turn RIGHT", zone = "Mistveil Tangle", x = 29.31, y = 59.10 },
    { text = "Go FORWARD / slight-right", zone = "Mistveil Tangle", x = 28.59, y = 58.53 },
    { text = "Turn LEFT, then kill Shizgher - the mount is a 100% drop for everyone who arrived via the correct path", zone = "Mistveil Tangle", x = 27.56, y = 57.85 },
  },
})

Add({
  id = "otto", name = "Otto", type = "mount",
  collection = { kind = "mount", id = 1656 },
  expansion = "dragonflight", game = "retail", zone = "Waking Shores / Dragon Isles fishing",
  reward = "Otto mount (ottuk with shades)", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "Hours of fishing (Kingfin is the choke point)",
  timeGate = nil, rng = "Fishing grind: Gold Coin and Kingfin are the slow parts", prereq = nil,
  source = "https://warcraft-secrets.com/guides/dragonflight-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Fish or harpoon up a Gold Coin of the Isles, or trade Copper to Silver to Gold coins at Iskaara", zone = "Dragon Isles / Iskaara" },
    { text = "Give the Gold Coin to The Great Swog for the Immaculate Sac of Swog Treasures and the Aquatic Shades toy", zone = "Dragon Isles" },
    { text = "Wear the shades at The Bubble Bath dance pad near the Obsidian Citadel and dance for 5 minutes to be teleported to the Hissing Grotto", zone = "Waking Shores" },
    { text = "Take the Empty Fish Barrel and fill it: 100 Frigid Floe Fish, 25 Calamitous Carp, 1 Kingfin the Wise Whiskerfish", zone = "Dragon Isles fishing" },
    { text = "Place the overflowing barrel (spot cited in a secondary source - verify against the source guide)", zone = "Waking Shores", x = 20, y = 39 },
    { text = "Otto appears - accept The Way to an Otto's Heart for the mount", zone = "Waking Shores / Hissing Grotto" },
  },
})

Add({
  id = "divine-kiss-of-ohnahra", name = "Divine Kiss of Ohn'ahra", type = "mount",
  collection = { kind = "mount", id = 1545 },
  expansion = "dragonflight", game = "retail", zone = "Ohn'ahran Plains",
  reward = "Divine Kiss of Ohn'ahra mount", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "Dungeon runs (after the Renown gate)",
  timeGate = nil, rng = nil, prereq = "Maruuk Centaur Renown 25 for the hidden quest from Godoloto",
  source = "https://warcraft-secrets.com/guides/dragonflight-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "At Maruuk Renown 25, pick up the hidden quest A Whispering Breeze from Godoloto", zone = "Ohn'ahran Plains" },
    { text = "Bring 3 Stolen Breath of Ohn'ahra from the last boss of the Nokhud Offensive", zone = "Nokhud Offensive" },
    { text = "Bring 1 Exultant Incense (crafted or Auction House)", zone = "Dragon Isles" },
    { text = "Bring 1 Essence of Awakening from Quartermaster Huseng (needs Renown 7; Huseng area cited in a secondary source)", zone = "Thaldraszus", x = 60, y = 80 },
    { text = "Speak to Ohn'ahra to receive the mount", zone = "Ohn'ahran Plains" },
  },
})

Add({
  id = "magmashell", name = "Magmashell", type = "mount",
  collection = { kind = "mount", id = 1469 },
  expansion = "dragonflight", game = "retail", zone = "Waking Shores",
  reward = "Magmashell mount (magma snail)", mindSeeker = false,
  solo = "Solo", difficulty = 2, estTime = "Shell drop, then a 20-second channel",
  timeGate = nil, rng = "Empty Magma Shell is a drop from lava-area snails/elementals", prereq = nil,
  source = "https://conquestcapped.com/guides/wow/magmashell/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Get an Empty Magma Shell, dropped by the Empowered Snail-area elementals and lava snails", zone = "Waking Shores" },
    { text = "Use the shell on the Empowered Snail in the lava pool", zone = "Waking Shores" },
    { text = "Survive the full 20-second channel standing in lava (immunities and healing cooldowns help) - success guarantees the mount", zone = "Waking Shores" },
  },
})

Add({
  id = "secrets-of-azeroth", name = "Secrets of Azeroth", type = "questline",
  expansion = "dragonflight", game = "retail", zone = "Azeroth-wide",
  reward = "Pattie mount / Tobias pet / Mimiron's Jumpjets mount / Torch of Pyrreth toy", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "~2-4h with guide",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/dragonflight-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Work the clue chain (originally a clue-a-day event, now permanent) toward the Whodunnit? meta for the Pattie alpaca mount", zone = "Azeroth-wide" },
    { text = "Use the Community Rumor Mill and Buried Satchels to earn the Tobias pet - SecretGPS carries the full 17-satchel route in its own Tobias entry", zone = "Azeroth-wide" },
    { text = "Forge Mimiron's Jumpjets from its 3 booster parts - see the dedicated Mimiron's Jumpjets entry for the part locations and the Empowered Arcane Forge", zone = "Azeroth-wide" },
    { text = "The final secret (The Race) charges the 4 Titan Power Relay consoles in Tyrhold with components looted from Broken Urns - console 1", zone = "Tyrhold", mapID = 2025, x = 59.3, y = 56.9 },
    { text = "Titan Power Relay console 2", zone = "Tyrhold", mapID = 2025, x = 61.0, y = 55.0 },
    { text = "Titan Power Relay console 3", zone = "Tyrhold", mapID = 2025, x = 59.5, y = 60.6 },
    { text = "Titan Power Relay console 4", zone = "Tyrhold", mapID = 2025, x = 61.0, y = 62.4 },
    { text = "Earn the Torch of Pyrreth toy - it is a prerequisite for Incognitro", zone = "Azeroth-wide" },
  },
})

Add({
  id = "incognitro", name = "Incognitro, the Indecipherable Felcycle", type = "mount",
  collection = { kind = "mount", id = 1943 },
  expansion = "tww", game = "retail", zone = "Dornogal > Azj-Kahet / Hallowfall > Karazhan Catacombs",
  reward = "Incognitro, the Indecipherable Felcycle mount", mindSeeker = true,
  solo = "Solo", difficulty = 5, estTime = "Days for most players",
  timeGate = nil, rng = nil, prereq = "Detective title (Azeroth's Greatest Detective chain) and the Torch of Pyrreth toy",
  source = "https://warcraft-secrets.com/guides/incognitro-the-indecipherable-felcycle",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Equip the Detective title and find the Dalaran Survivor", zone = "Dornogal", x = 54.99, y = 28.92 },
    { text = "Ratts' Race: find the note in the Azj-Kahet cave", zone = "Azj-Kahet", x = 69.3, y = 93.3 },
    { text = "Ratts' Race: find the note in the City of Threads", zone = "City of Threads", x = 42.2, y = 72.0 },
    { text = "Ratts' Race: find the note at the Hallowfall pond", zone = "Hallowfall", x = 50.7, y = 86.6 },
    { text = "Reach Ratt's hideout for the Peculiar Gem and Inert Peculiar Key", zone = "Azj-Kahet", x = 55.0, y = 19.1 },
    { text = "Karazhan Catacombs (Ratts' Revenge): solve the 9 o'clock puzzles to light 9 orbs - the Enigma Machine is here", zone = "Karazhan Catacombs", mapID = 46, x = 60.0, y = 43.0 },
    { text = "Puzzle 9: enter the Pillar-nest Vosh cave in Azj-Kahet", zone = "Azj-Kahet", mapID = 2255, x = 55.2, y = 19.2 },
    { text = "Use the Starry-Eyed Goggles to reveal the platform and the Relic of Crystal Connections to teleport up - jump puzzle point 1", zone = "Azj-Kahet", mapID = 2255, x = 56.35, y = 17.25 },
    { text = "Jump puzzle point 2", zone = "Azj-Kahet", mapID = 2255, x = 56.35, y = 17.45 },
    { text = "Enter console code 84847078 and loot the chest for the mount", zone = "Azj-Kahet" },
  },
})

Add({
  id = "mind-seeker", name = "Mind-Seeker (meta)", type = "achievement",
  expansion = "midnight", game = "retail", zone = "Vashj'ir > Seat of Knowledge",
  reward = "Mind-Seeker title + Feat of Strength", mindSeeker = false,
  solo = "Solo", difficulty = 5, estTime = "Inherits the time of the 17 secrets you solve",
  timeGate = nil, rng = nil, prereq = "Water breathing and an aquatic mount are recommended for the Pearl dive",
  source = "https://warcraft-secrets.com/guides/mind-seeker",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Optional speed boost: get Atomized Salien Slime from Al'kubian (after a short questline) to raise swim speed", zone = "Azj-Kahet", mapID = 2255, x = 60.0, y = 66.2 },
    { text = "Swim to the safe point south of the Abyssal Depths", zone = "Vashj'ir", mapID = 13, x = 27.8, y = 73.4 },
    { text = "Dive straight down, managing fatigue; when the water turns grey to dark blue, swim to the Pearl of the Abyss and physically touch it", zone = "Vashj'ir", mapID = 13, x = 27.8, y = 74.5 },
    { text = "You are teleported to an alternate Seat of Knowledge - holograms show each of the 34 canonical secrets you have solved (buying a pet on the Auction House does not count; solving does)", zone = "Seat of Knowledge" },
    { text = "Solve 17 of the canonical secrets to qualify (the room displays 33 secret records plus the Mind-Seeker trophy; SecretGPS catalogs all 33 records - /sgps mindseeker shows your catalog count)", zone = "Azeroth-wide" },
    { text = "Speak to Anakron and say 'I am ready' to earn the Mind-Seeker Feat of Strength and title", zone = "Seat of Knowledge" },
  },
})
