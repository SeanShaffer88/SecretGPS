-- SecretGPS -- Retail data (expansions batch 1: older world, Legion, BfA)
-- Transcribed from the 2026-10-23 research report, sections 3.1-3.3.
-- Coordinates and IDs appear only where that report sourced them; entries
-- whose steps/coords were not extracted in the report say so honestly.
local _, ns = ...
ns.Entries = ns.Entries or {}
local function Add(e) ns.Entries[#ns.Entries + 1] = e end

Add({
  id = "time-lost-proto-drake", name = "Time-Lost Proto-Drake", type = "mount",
  collection = { kind = "mount", id = 265 },
  expansion = "wotlk", game = "retail", zone = "The Storm Peaks",
  reward = "Reins of the Time-Lost Proto-Drake mount", mindSeeker = false,
  status = "Evergreen rare camp",
  solo = "Solo", difficulty = 5, estTime = "Camp: hours to days",
  timeGate = nil, rng = "Rare spawn shared with Vyragosa; community-estimated 6-22h+ between spawns and no spawn for at least 6h after a Vyragosa/TLPD kill (estimates, not Blizzard-published)", prereq = "Flying, to pull it while airborne (out of ground range)",
  source = "https://wowpedia.fandom.com/wiki/Time-Lost_Proto-Drake",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Camp or patrol spawn point 1 of 4 - it shares its spawn with Vyragosa, which is far more common", zone = "The Storm Peaks", x = 31, y = 69 },
    { text = "Camp or patrol spawn point 2 of 4", zone = "The Storm Peaks", x = 51, y = 70 },
    { text = "Camp or patrol spawn point 3 of 4", zone = "The Storm Peaks", x = 35, y = 76 },
    { text = "Camp or patrol spawn point 4 of 4", zone = "The Storm Peaks", x = 52, y = 34 },
    { text = "Pull it while flying and kill it - the Reins drop 100% on kill", zone = "The Storm Peaks" },
  },
})

Add({
  id = "aeonaxx", name = "Aeonaxx: Phosphorescent Stone Drake", type = "mount",
  collection = { kind = "mount", id = 393 },
  expansion = "cata", game = "retail", zone = "Deepholm",
  reward = "Reins of the Phosphorescent Stone Drake mount", mindSeeker = false,
  status = "Evergreen rare camp",
  solo = "Solo", difficulty = 5, estTime = "Camp: 6-22h+ (community estimate)",
  timeGate = nil, rng = "The spawn is usually the bat Blood Seeker instead (about 1 in 16 Aeonaxx per community research)", prereq = "Flying in Deepholm",
  source = "https://wowwiki-archive.fandom.com/wiki/Aeonaxx",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Camp spawn point 1 of 6", zone = "Deepholm", x = 42, y = 47 },
    { text = "Camp spawn point 2 of 6", zone = "Deepholm", x = 44, y = 43 },
    { text = "Camp spawn point 3 of 6", zone = "Deepholm", x = 42, y = 60 },
    { text = "Camp spawn point 4 of 6", zone = "Deepholm", x = 47, y = 57 },
    { text = "Camp spawn point 5 of 6", zone = "Deepholm", x = 52, y = 64 },
    { text = "Camp spawn point 6 of 6", zone = "Deepholm", x = 51, y = 43 },
    { text = "Mount Aeonaxx when it spawns and kill it while riding it", zone = "Deepholm" },
  },
})

Add({
  id = "poseidus", name = "Poseidus: Reins of Poseidus", type = "mount",
  collection = { kind = "mount", id = 420 },
  expansion = "cata", game = "retail", zone = "Vashj'ir (Shimmering Expanse / Abyssal Depths)",
  reward = "Reins of Poseidus mount (Bind on Equip)", mindSeeker = false,
  status = "Evergreen rare camp",
  solo = "Solo", difficulty = 5, estTime = "Camp: 2-8 hour respawn",
  timeGate = "Respawn 2-8 hours; he does not share a spawn timer with any other rare", rng = "Rare spawn, heavily camped", prereq = "Aquatic movement in Vashj'ir",
  source = "https://www.wowhead.com/guide/poseidus-mount",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Check the five spawn points (four in Shimmering Expanse, one in Abyssal Depths). Poseidus swims a small circle close to his spawn point and never despawns while alive. Spawn 1: Ruins of Thelserai", zone = "Shimmering Expanse", x = 66.6, y = 41.4 },
    { text = "Spawn 2: Biel'aran Ridge", zone = "Shimmering Expanse", x = 58.4, y = 82.2 },
    { text = "Spawn 3: Glimmerdeep Gorge", zone = "Shimmering Expanse", x = 46.6, y = 50.0 },
    { text = "Spawn 4: Ruins of Vashj'ir", zone = "Shimmering Expanse", x = 40.0, y = 67.8 },
    { text = "Spawn 5: Underlight Canyon, deep in the Abyssal Depths", zone = "Abyssal Depths", x = 41.4, y = 76.3 },
    { text = "Kill Poseidus - the Reins of Poseidus drop 100%", zone = "Vashj'ir" },
  },
})

Add({
  id = "grey-riding-camel", name = "Grey Riding Camel", type = "mount",
  collection = { kind = "mount", id = 400 },
  expansion = "cata", game = "retail", zone = "Uldum",
  reward = "Reins of the Grey Riding Camel mount + 'the Camel-Hoarder' title", mindSeeker = false,
  status = "Evergreen rare camp",
  solo = "Solo", difficulty = 4, estTime = "Camp/search: hours plus RNG figurine",
  timeGate = nil, rng = "Most Mysterious Camel Figurines crumble to dust; only a correct one teleports you", prereq = nil,
  source = "https://wowpedia.fandom.com/wiki/Mysterious_Camel_Figurine",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Search Uldum for a tiny Mysterious Camel Figurine - there are 100+ possible spawn points; the full point list was not transcribed in the research, see the Wowhead figurine guide", zone = "Uldum" },
    { text = "Click a figurine: most crumble to dust, a correct one teleports you to the Steam Pools", zone = "Uldum > Steam Pools" },
    { text = "Kill Dormus the Camel-Hoarder at the Steam Pools for the mount and the title", zone = "Steam Pools" },
  },
})

Add({
  id = "alani", name = "Alani: Thundering Ruby Cloud Serpent", type = "mount",
  collection = { kind = "mount", id = 517 },
  expansion = "mop", game = "retail", zone = "Vale of Eternal Blossoms",
  reward = "Reins of the Thundering Ruby Cloud Serpent mount", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "Multi-day farm (typical)",
  timeGate = nil, rng = "Skyshards are a rare drop from Vale mobs", prereq = nil,
  source = "https://wowpedia.fandom.com/wiki/Alani",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Farm Vale of Eternal Blossoms mobs for 10 Skyshards (rare drop)", zone = "Vale of Eternal Blossoms" },
    { text = "Combine the 10 Skyshards into a Sky Crystal", zone = "Vale of Eternal Blossoms" },
    { text = "Use the Sky Crystal on Alani - she is invulnerable until then - and kill her for the mount", zone = "Vale of Eternal Blossoms" },
  },
})

Add({
  id = "voidtalon", name = "Voidtalon of the Dark Star", type = "mount",
  collection = { kind = "mount", id = 682 },
  expansion = "wod", game = "retail", zone = "Draenor (all zones)",
  reward = "Voidtalon of the Dark Star mount", mindSeeker = false,
  status = "Evergreen rare camp",
  solo = "Solo", difficulty = 5, estTime = "Camp: 2-8+ hour respawn",
  timeGate = "First portal 48h after a server reset; respawn at least 2h if unclaimed, at least 8h once claimed",
  rng = "Edge of Reality portals spawn at one of 28 points; only one player can enter each portal", prereq = "Level 10+",
  source = "https://warcraft-secrets.com/guides/voidtalon-of-the-dark-star",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Wait at least 48 hours after the last server reset. Camp Shadowmoon Valley or Frostfire Ridge (enough players keep those zones from resetting); swapping Chromie Time / War Mode puts you on a different shard", zone = "Draenor" },
    { text = "Shadowmoon Valley portal spot", zone = "Shadowmoon Valley (Draenor)", mapID = 539, x = 51.7, y = 74.8 },
    { text = "Shadowmoon Valley portal spot", zone = "Shadowmoon Valley (Draenor)", mapID = 539, x = 50.3, y = 71.5 },
    { text = "Shadowmoon Valley portal spot", zone = "Shadowmoon Valley (Draenor)", mapID = 539, x = 48.8, y = 70.2 },
    { text = "Shadowmoon Valley portal spot", zone = "Shadowmoon Valley (Draenor)", mapID = 539, x = 46.6, y = 70.2 },
    { text = "Shadowmoon Valley portal spot", zone = "Shadowmoon Valley (Draenor)", mapID = 539, x = 43.6, y = 71.3 },
    { text = "Shadowmoon Valley portal spot", zone = "Shadowmoon Valley (Draenor)", mapID = 539, x = 41.9, y = 75.6 },
    { text = "Frostfire Ridge portal spot", zone = "Frostfire Ridge", mapID = 525, x = 48.0, y = 27.4 },
    { text = "Frostfire Ridge portal spot", zone = "Frostfire Ridge", mapID = 525, x = 51.1, y = 19.9 },
    { text = "Frostfire Ridge portal spot", zone = "Frostfire Ridge", mapID = 525, x = 52.4, y = 18.2 },
    { text = "Frostfire Ridge portal spot", zone = "Frostfire Ridge", mapID = 525, x = 53.8, y = 17.3 },
    { text = "Gorgrond portal spot", zone = "Gorgrond", mapID = 543, x = 43.2, y = 34.2 },
    { text = "Gorgrond portal spot", zone = "Gorgrond", mapID = 543, x = 51.6, y = 38.6 },
    { text = "Gorgrond portal spot", zone = "Gorgrond", mapID = 543, x = 54.0, y = 45.8 },
    { text = "Gorgrond portal spot", zone = "Gorgrond", mapID = 543, x = 56.0, y = 40.6 },
    { text = "Talador portal spot", zone = "Talador", mapID = 535, x = 39.9, y = 55.6 },
    { text = "Talador portal spot", zone = "Talador", mapID = 535, x = 46.2, y = 52.5 },
    { text = "Talador portal spot", zone = "Talador", mapID = 535, x = 47.1, y = 48.8 },
    { text = "Talador portal spot", zone = "Talador", mapID = 535, x = 52.1, y = 41.1 },
    { text = "Talador portal spot", zone = "Talador", mapID = 535, x = 52.7, y = 34.4 },
    { text = "Talador portal spot", zone = "Talador", mapID = 535, x = 50.9, y = 32.4 },
    { text = "Talador portal spot", zone = "Talador", mapID = 535, x = 52.2, y = 25.9 },
    { text = "Nagrand (Draenor) portal spot", zone = "Nagrand (Draenor)", mapID = 550, x = 57.2, y = 26.5 },
    { text = "Nagrand (Draenor) portal spot", zone = "Nagrand (Draenor)", mapID = 550, x = 44.0, y = 30.8 },
    { text = "Nagrand (Draenor) portal spot", zone = "Nagrand (Draenor)", mapID = 550, x = 40.5, y = 47.6 },
    { text = "Spires of Arak portal spot", zone = "Spires of Arak", mapID = 542, x = 60.9, y = 11.2 },
    { text = "Spires of Arak portal spot", zone = "Spires of Arak", mapID = 542, x = 46.8, y = 20.2 },
    { text = "Spires of Arak portal spot", zone = "Spires of Arak", mapID = 542, x = 36.4, y = 18.3 },
    { text = "Spires of Arak portal spot", zone = "Spires of Arak", mapID = 542, x = 50.4, y = 6.3 },
    { text = "Click the Edge of Reality portal (only one player can enter; clicking it while grouped sends the mount to your mailbox) and loot the Voidtalon Egg inside", zone = "Edge of Reality scenario" },
  },
})

Add({
  id = "terky", name = "Terky", type = "pet",
  collection = { kind = "pet", id = 1073 },
  expansion = "wod", game = "retail", zone = "Borean Tundra (Riplash Ruins)",
  reward = "Terky pet", mindSeeker = false,
  solo = "Solo", difficulty = 1, estTime = "Minutes",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/terky",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Fly to the Riplash Ruins at the southern end of Borean Tundra and dive into the water to find the underwater cave entrance", zone = "Borean Tundra", x = 55.8, y = 88.1 },
    { text = "Swim across the cave, then upward into a small room. The White Murloc Egg sits behind the large pearl in a crustacean corpse - loot it for Terky (originally an Asia iCoke promo pet, made worldwide in patch 6.2.2)", zone = "Borean Tundra", x = 54.6, y = 89.4 },
  },
})

Add({
  id = "pepe", name = "Pepe & Costumes", type = "toy",
  collection = { kind = "toy", id = 122293 },
  expansion = "wod", game = "retail", zone = "Garrison / Draenor + later zones",
  reward = "Trans-Dimensional Bird Whistle toy (Pepe) + costume collection", mindSeeker = false,
  solo = "Solo", difficulty = 2, estTime = "Varies per costume",
  timeGate = "Scarecrow (Hallow's End) and Greatfeather (Winter Veil) costumes are holiday-only", rng = "The Goggles costume Pepe has many Dalaran spots (instant respawn)", prereq = nil,
  source = "https://warcraft-secrets.com/guides/pepe",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Whistle: complete the achievement What A Strange, Interdimensional Trip It's Been (defeat numerous Warlords of Draenor bosses while Pepe accompanies you) to earn the Trans-Dimensional Bird Whistle", zone = "Draenor" },
    { text = "Pirate Pepe (A Tiny Pirate Hat): on a rock in the arakkoa ruins, south-west Spires of Arak", zone = "Spires of Arak", mapID = 542, x = 54.2, y = 83.5 },
    { text = "Viking Pepe (A Tiny Viking Helmet): on a box by two dancing goblins at the Ring of Trials", zone = "Nagrand (Draenor)", mapID = 550, x = 80.2, y = 50.3 },
    { text = "Knight Pepe (A Tiny Plated Helm): on a chest in a draenei tent, upper Auchindoun area", zone = "Talador", mapID = 535, x = 51.0, y = 63.3 },
    { text = "Ninja Pepe (A Tiny Ninja Shroud): on a chair in an Iron Horde campsite tent", zone = "Gorgrond", mapID = 543, x = 47.5, y = 41.2 },
    { text = "Robot Pepe (A Tiny Clockwork Key): in Mechagon's Alternate Future (first visit via Chromie at 70 31 in Mechagon when she is the daily visitor)", zone = "Mechagon (Alternate Future)", mapID = 1462, x = 68.5, y = 47.9 },
    { text = "Zandalari Pepe (A Tiny Voodoo Mask): on the stand by the right-side entrance of the Hot House in Dazar'alor (Horde territory)", zone = "Dazar'alor", mapID = 1165, x = 38.5, y = 16.1 },
    { text = "Diving Pepe (A Tiny Diving Helmet): in a fishtank in Catherine Morgan's house in Boralus (Alliance territory)", zone = "Boralus", mapID = 1161, x = 54.1, y = 71.6 },
    { text = "Dragon Pepe (A Tiny Dragon Goblet): Valdrakken", zone = "Thaldraszus (Valdrakken)", mapID = 2112, x = 50.6, y = 53.1 },
    { text = "Tuskarr Pepe (A Tiny Ear Warmer): Iskaara", zone = "The Azure Span (Iskaara)", mapID = 2024, x = 13.0, y = 48.6 },
    { text = "Explorer Pepe (A Tiny Explorer's Hat): Dragonscale Basecamp", zone = "The Waking Shores", mapID = 2022, x = 47.3, y = 82.7 },
    { text = "Traveler Pepe (A Tiny Pair of Goggles): wearing goggles somewhere in Dalaran (Broken Isles) - the spot rotates through about 30 places; the guide lists them all", zone = "Dalaran (Broken Isles)" },
    { text = "Covenant costumes (Wings, Vial of Slime, Winter Staff, Sinstone): Renown 56 with Kyrian / Necrolord / Night Fae / Venthyr respectively", zone = "Shadowlands" },
    { text = "Holiday costumes: Scarecrow - interact with Pepe in a level 3 garrison during Hallow's End; Greatfeather - on the Smokeywoods Pastures cart in Orgrimmar / Ironforge during Winter Veil", zone = "Garrison / capitals" },
  },
})

Add({
  id = "gara", name = "Gara", type = "hunterpet",
  expansion = "wod", game = "retail", zone = "Shadowmoon Valley (Draenor)",
  reward = "Gara, the spirit wolf (Hunter pet)", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "~1-2h",
  timeGate = nil, rng = nil, prereq = "Beast Mastery Hunter",
  source = "https://www.wow-petopia.com/search.php?search=1&offset=0&sortby=look&term=spirit",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Work through Gara's multi-step, story-heavy questline across Draenor, starting in Shadowmoon Valley (Draenor) - it involves shadowberries among other items; per-step coordinates are in Petopia / Wowhead, not extracted in the research", zone = "Shadowmoon Valley (Draenor) > Draenor" },
    { text = "Tame the spirit wolf Gara at the end of the questline", zone = "Draenor" },
  },
})

Add({
  id = "spirit-beasts-wotlk", name = "Spirit Beasts (WotLK set)", type = "hunterpet",
  expansion = "wotlk", game = "retail", zone = "Sholazar Basin / Zul'Drak / Grizzly Hills / The Storm Peaks",
  reward = "Loque'nahak, Gondria, Arcturis, Skoll (Hunter spirit beast tames)", mindSeeker = false,
  solo = "Solo", difficulty = 4, estTime = "Camps: hours, contested",
  timeGate = nil, rng = "Rare spawns on shared rare timers", prereq = "Beast Mastery Hunter (Exotic pets)",
  source = "https://eu.forums.blizzard.com/en/wow/t/rare-spirit-beast-help/139560",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Loque'nahak: camp the ring of about 7-9 spawn points in Sholazar Basin (shared rare timer). Exact points are zone-level only in the research - pull them from Petopia per NPC before encoding waypoints", zone = "Sholazar Basin" },
    { text = "Gondria: camp 5 points between the altars in Zul'Drak", zone = "Zul'Drak" },
    { text = "Arcturis: camp its single spawn point on the hill by Amberpine Lodge / the river in Grizzly Hills - the easiest camp of the set", zone = "Grizzly Hills" },
    { text = "Skoll: camp 5 points in The Storm Peaks, in the Time-Lost Proto-Drake route area", zone = "The Storm Peaks" },
    { text = "Tame Beast on the spirit beast when it spawns", zone = "Northrend" },
  },
})

Add({
  id = "spirit-beasts-cata", name = "Spirit Beasts (Cataclysm challenge set)", type = "hunterpet",
  expansion = "cata", game = "retail", zone = "Vashj'ir / Mount Hyjal / Twilight Highlands",
  reward = "Ghostcrawler, Ankha, Magria, Ban'thalos, Karoma (Hunter spirit beast tames)", mindSeeker = false,
  solo = "Solo", difficulty = 4, estTime = "Camps plus challenge tames",
  timeGate = nil, rng = "Rare spawns; Ghostcrawler phases in and out on a very long patrol", prereq = "Beast Mastery Hunter; Firelands / Molten Front progression for the Hyjal set",
  source = "https://eu.forums.blizzard.com/en/wow/t/rare-spirit-beast-help/139560",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Ghostcrawler: find it on its very long patrol at the Abandoned Reef in Vashj'ir - it phases in and out and cannot be trapped", zone = "Vashj'ir (Abandoned Reef)" },
    { text = "Ankha and Magria (Hyjal Regrowth): tame with NOTHING equipped - they one-shot armored hunters", zone = "Mount Hyjal (Regrowth)" },
    { text = "Ban'thalos: it flies high above the Shrine of Malorne - use slowfall / a tree-drop tame", zone = "Mount Hyjal (Shrine of Malorne)" },
    { text = "Karoma: camp its multiple spawn points in the Twilight Highlands", zone = "Twilight Highlands" },
  },
})

Add({
  id = "spirit-beasts-mop", name = "Spirit Beasts (MoP challenge tames)", type = "hunterpet",
  expansion = "mop", game = "retail", zone = "Jade Forest / Valley of the Four Winds / Kun-Lai Summit",
  reward = "Hutia, Degu, Gumi (Hunter spirit beast tames)", mindSeeker = false,
  solo = "Solo", difficulty = 4, estTime = "Challenge tames",
  timeGate = nil, rng = nil, prereq = "Beast Mastery Hunter",
  source = "https://eu.forums.blizzard.com/en/wow/t/rare-spirit-beast-help/139560",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Hutia (Jade Forest): it heals and hits hard in melee - keep it slowed and kited, and tame only at or below 20% HP", zone = "Jade Forest" },
    { text = "Degu (Valley of the Four Winds): damage it with ranged attacks only and stay at range, then tame at low HP", zone = "Valley of the Four Winds" },
    { text = "Gumi (Kun-Lai Summit): same pattern - bring it to 20% HP or below while keeping it slowed, then tame", zone = "Kun-Lai Summit" },
  },
})

Add({
  id = "corrupted-ashbringer-original", name = "Corrupted Ashbringer (original)", type = "transmog",
  expansion = "vanilla", game = "retail", zone = "Naxxramas (original, removed)",
  reward = "Corrupted Ashbringer appearance - NOT OBTAINABLE in Retail", mindSeeker = false,
  status = "NOT OBTAINABLE in Retail - removed with original Naxxramas; listed so collectors are not sent on a dead hunt",
  solo = "Solo", difficulty = 1, estTime = "Not obtainable",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://wow.gg/guides/corrupted-ashbringer-transmog-guide",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Do NOT hunt this: the original Corrupted Ashbringer dropped from the Four Horsemen chest in the original 40-player Naxxramas, which was removed when Naxxramas moved in WotLK", zone = "Naxxramas (original, removed)" },
    { text = "Only players who owned it from the original raid keep the appearance today", zone = "Retail" },
    { text = "This is distinct from the Legion hidden artifact appearance of the same name for Retribution Paladins - see the Hidden Artifact Appearances entry, which IS still obtainable", zone = "Legion" },
  },
})

Add({
  id = "hidden-artifact-appearances", name = "Hidden Artifact Appearances", type = "transmog",
  expansion = "legion", game = "retail", zone = "Class-specific (Broken Isles and beyond)",
  reward = "Hidden appearance for each Legion artifact weapon (one per spec, all 12 classes)", mindSeeker = false,
  solo = "Solo", difficulty = 4, estTime = "Varies per class/spec",
  timeGate = nil, rng = "Some appearances involve drops or puzzles depending on class", prereq = "Class-locked: each appearance is for that class's artifact; still obtainable in Retail post-Legion (other tints have extra requirements - verify per class in the sub-guides)",
  source = "https://warcraft-secrets.com/guides/legion-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "There is one hidden appearance per artifact weapon, each with its own trigger (drops, puzzles, order-hall secrets). Use the Warcraft Secrets hidden-artifact sub-guide for YOUR class - per-class steps and coordinates are in those sub-guides, not extracted here", zone = "Class-specific" },
    { text = "Retribution Paladin (Corrupted Ashbringer appearance): reach Artifact Knowledge 6, then combine the two Nat Pagle books via Sister Elda to start the untracked quest", zone = "Order Hall / Dalaran" },
    { text = "Retribution chain: face Prince Tortheldrin in Dire Maul with the Head of Nefarian", zone = "Dire Maul" },
    { text = "Retribution chain: visit Bardu Sharpeye / Alexia Ironknife (faction-specific)", zone = "Faction-specific" },
    { text = "Retribution chain: find Isillien's Journal at Hearthglen", zone = "Hearthglen" },
    { text = "Retribution chain: complete the slime / fishing finale in the Western Plaguelands, on the Thondroril river", zone = "Western Plaguelands (Thondroril)" },
  },
})

Add({
  id = "smoldering-ember-wyrm", name = "Smoldering Ember Wyrm (Nightbane)", type = "mount",
  collection = { kind = "mount", id = 883 },
  expansion = "legion", game = "retail", zone = "Return to Karazhan (Mythic)",
  reward = "Smoldering Ember Wyrm mount", mindSeeker = false,
  solo = "Group (dungeon; soloable at max level)", difficulty = 3, estTime = "One timed dungeon run per attempt",
  timeGate = "The crystal route is timed from the moment you enter", rng = "The mount is not a guaranteed drop (see Blizzard's loot article)", prereq = "Return to Karazhan on Mythic difficulty",
  source = "https://warcraft-secrets.com/guides/nightbane-secret-karazhan-boss",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Enter Return to Karazhan on Mythic. The emote 'The strange chill of a dark presence winds through the air' starts the timer. Each crystal grants a stacking Medivh's Echo buff that adds time - keep the whole party near each crystal (the buff is lost on death)", zone = "Return to Karazhan" },
    { text = "Crystal 1: middle of the platform opposite the Opera stage, among the spectators", zone = "Return to Karazhan" },
    { text = "Crystal 2: last room on the left in the hallway leading to the Maiden of Virtue (you do not need to kill her)", zone = "Return to Karazhan" },
    { text = "Crystal 3: behind the table in Moroes' dining room - kill Moroes first", zone = "Return to Karazhan" },
    { text = "Crystal 4: the spider cellar under the dining room; afterwards take the portal back to the entrance", zone = "Return to Karazhan" },
    { text = "Crystal 5: spawns where you defeat The Curator", zone = "Return to Karazhan" },
    { text = "With Medivh's Presence, run back down to the entrance, turn LEFT to the terrace and talk to the Echo of Medivh to summon Nightbane (achievement: One Night in Karazhan)", zone = "Return to Karazhan" },
    { text = "Kill Nightbane for a chance at the Smoldering Ember Wyrm (personal loot)", zone = "Return to Karazhan" },
  },
})

Add({
  id = "underlight-angler", name = "Underlight Angler", type = "transmog",
  expansion = "legion", game = "retail", zone = "Broken Isles",
  reward = "Underlight Angler fishing artifact (plus alternate colors via Fisherfriend of the Isles)", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "Fishing grind",
  timeGate = nil, rng = "Luminous Pearl is fished up from fish schools", prereq = "'Bigger Fish to Fry' achievement and Legion Fishing 100",
  source = "https://warcraft-secrets.com/guides/underlight-angler",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Earn the Bigger Fish to Fry achievement and reach Legion Fishing 100", zone = "Broken Isles" },
    { text = "Fish in any fish school in the Broken Isles until you fish up a Luminous Pearl", zone = "Broken Isles" },
    { text = "Take the pearl through the Khadgar / Dalaran fountain quest", zone = "Dalaran" },
    { text = "Complete the Nat Pagle scenario: clear the murloc island, fish 15 Gloaming Frenzy, and kill Mglrrp", zone = "Nat Pagle scenario" },
    { text = "Optional: earn alternate colors via Fisherfriend of the Isles", zone = "Broken Isles" },
  },
})

Add({
  id = "endgineer-omegaplugg", name = "Endgineer Omegaplugg: Vial of Green Goo", type = "toy",
  collection = { kind = "toy", id = 141331 },
  expansion = "legion", game = "retail", zone = "Gnomeregan",
  reward = "Vial of Green Goo toy (from the hidden boss Endgineer Omegaplugg)", mindSeeker = false,
  solo = "Group (party needed)", difficulty = 3, estTime = "One dungeon run",
  timeGate = nil, rng = nil, prereq = "A party",
  source = "https://warcraft-secrets.com/guides/endgineer-omegaplugg",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Get to Gnomeregan: Alliance fly from Ironforge; Horde take the teleporter by Scooty in Northern Stranglethorn", zone = "Northern Stranglethorn", x = 36.8, y = 51.0 },
    { text = "Kill Mekgineer Thermaplugg (the last boss). Behind the first pillar on the left, click the small 'PUSH ME!' button - Endgineer Omegaplugg spawns in the middle of the room", zone = "Gnomeregan" },
    { text = "Disable the bombs first: pull the boss and run out to reset him, then click all 6 big red buttons counter-clockwise starting from the first pillar on the right. Repeat (usually 2-3 resets) until bombs stop spawning - an engineer's EMP Generator also works", zone = "Gnomeregan" },
    { text = "Fight: dodge missiles, dispel Static, interrupt Maximum Repair under 50% (or he heals to full), and face him away from the group. Everyone who fought gets a Vial of Green Goo", zone = "Gnomeregan" },
  },
})

Add({
  id = "legion-hunter-tomes", name = "Hunter Tomes & Special Tames (Legion)", type = "hunterpet",
  expansion = "legion", game = "retail", zone = "Broken Isles / Orgrimmar / Stormwind",
  reward = "New Hunter pet family unlocks (tomes) plus Fenryr, Gon, and Lost Spectral Gryphon tames", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "Varies per tome/tame",
  timeGate = nil, rng = nil, prereq = "Hunter (Beast Mastery for exotics)",
  source = "https://warcraft-secrets.com/guides/legion-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Obtain the tomes that teach new pet families - for example Mechanicals, and Feathermanes via tome plus quest. Per-tome sources are in the Hunter Tomes guide, not extracted in the research", zone = "Broken Isles" },
    { text = "Fenryr: tameable via the solo route through Mythic Halls of Valor", zone = "Halls of Valor (Mythic)" },
    { text = "Gon: hidden spectral trigger in Orgrimmar - click the spectral eggshell", zone = "Orgrimmar" },
    { text = "Lost Spectral Gryphon: hidden trigger in Stormwind", zone = "Stormwind" },
  },
})

Add({
  id = "nazjatar-blood-serpent", name = "Nazjatar Blood Serpent", type = "mount",
  collection = { kind = "mount", id = 1057 },
  expansion = "bfa", game = "retail", zone = "Nazjatar / Abyssal depths",
  reward = "Nazjatar Blood Serpent mount", mindSeeker = true,
  solo = "Solo / group farm", difficulty = 4, estTime = "Fragment farm",
  timeGate = nil, rng = "Abyssal Fragments are RNG drops from Nazjatar mobs", prereq = "Nazjatar access",
  source = "https://warcraft-secrets.com/guides/battle-for-azeroth-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Confirmed by the research: this secret exists, is in Nazjatar, and counts toward Mind-Seeker. Its full step list was NOT extracted in the research - confirm the exact fragment count and mechanic from the Warcraft Secrets guide before relying on this entry", zone = "Nazjatar" },
    { text = "Per the partial research summary (unverified count): collect Abyssal Fragments from Nazjatar mobs - a count of 20 was mentioned but must be confirmed in the source guide", zone = "Nazjatar" },
    { text = "Per the partial research summary: use the fragments at the Altar of the Abyss to summon the encounter for the mount - confirm the mechanic in the source guide", zone = "Nazjatar (Altar of the Abyss)" },
  },
})

Add({
  id = "mrrl", name = "Mrrl: Crimson Tidestallion & Secret Stash", type = "vendor",
  expansion = "bfa", game = "retail", zone = "Nazjatar",
  reward = "Crimson Tidestallion mount + Mrrl's Secret Stash items (via the secret vendor Mrrl)", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "Days of checking + one long trading session",
  timeGate = "Stock rotates daily; the Tidestallion only appears on some days. The Pinky Fingers and Blood Stones expire after 24 hours", rng = nil,
  prereq = "Azsh'ari Stormsurger Cape equipped (Trader's Stock buff); 666 gold for the taco",
  source = "https://warcraft-secrets.com/guides/mrrls-secret-stash",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Unlock Mrrl: pick up A Safer Place here and escort him to Newhome / Mezzamere, then finish No Backs (buy one item from each of his four murloc traders: Mrrglrlr, Grrmrlg, Flrgrrl, Hurlgrl)", zone = "Nazjatar", x = 48.0, y = 45.0 },
    { text = "Get the Azsh'ari Stormsurger Cape (world quests / rares, or keep buying Benthic Cloaks for 5 manapearls each from Finder Palta / Artisan Itanu) and wear it to see the special stocks", zone = "Nazjatar" },
    { text = "Check Mrrl daily until the Crimson Tidestallion is on offer - do not buy the expiring trade goods before then", zone = "Nazjatar" },
    { text = "Hungry Herald's Tentacle Taco: save Murloco from the naga in this random event, then buy the taco from him for 666 gold within 5 minutes (cape on)", zone = "Nazjatar", x = 46.3, y = 32.6 },
    { text = "2 Pulsating Blood Stones: Flrgrrl 288 Unidentified Mass > Hurlgrl 48 Dirty Murloc Socks (clean them in water) > Grrmrlg 16 Sea Giant Foot Dust; Mrrglrlr 210 Slimy Naga Eyeballs > Grrmrlg 70 Curious Murloc Horns > Hurlgrl 14 Healthy Murloc Lunch; then buy the stones from Mrrglrlr", zone = "Nazjatar" },
    { text = "4 Cultist Pinky Fingers: Hurlgrl 128 Sweet Sea Vegetables > Flrgrrl 32 Just Regular Butter > Mrrglrlr 16 Smelly Piles of Gloop; Mrrglrlr 504 Slimy Naga Eyeballs > Grrmrlg 168 Curious Murloc Horns > Flrgrrl 28 Ghost Food; then buy the fingers from Hurlgrl", zone = "Nazjatar" },
    { text = "Buy the Crimson Tidestallion from Mrrl (achievement: Mrrl's Secret Stash). Budding Deepcoral (5 manapearls, Finder Pruc / Artisan Okata) lets you ride it underwater in Nazjatar", zone = "Nazjatar" },
  },
})

Add({
  id = "child-of-torcali", name = "Child of Torcali", type = "mount",
  collection = { kind = "mount", id = 1249 },
  expansion = "bfa", game = "retail", zone = "Zuldazar",
  reward = "Child of Torcali direhorn mount (adult)", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "Weeks (daily stages)",
  timeGate = "Time-gated daily growth stages over many days (weeks)", rng = nil, prereq = "Zuldazar access",
  source = "https://wowpedia.fandom.com/wiki/Child_of_Torcali",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Honest gap: this entry's detailed steps were NOT verified in the research (the Wowhead guide was not opened in that pass). The outline below is the confirmed shape only - follow the source guide for exact steps", zone = "Zuldazar" },
    { text = "Find Torcali's child (the egg / hatchling) in Zuldazar to start the hidden questline", zone = "Zuldazar" },
    { text = "Raise the hatchling through daily stages over many days: feed it, play with it, and complete its growth stages", zone = "Zuldazar" },
    { text = "Once fully grown, receive the adult direhorn mount", zone = "Zuldazar" },
  },
})

Add({
  id = "hati", name = "Blood-Soaked Tome: Hati", type = "hunterpet",
  expansion = "bfa", game = "retail", zone = "Storm Peaks / Ulduar",
  reward = "Hati restored and tameable (6 color variants) + Essence Swapper toy", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "One questline",
  timeGate = nil, rng = nil, prereq = "Beast Mastery Hunter",
  source = "https://www.wow-petopia.com/search.php?search=1&offset=0&sortby=look&term=spirit",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Start the questline from Thorim / Grif (the chain begins at Trueshot Lodge)", zone = "Trueshot Lodge" },
    { text = "Recover the Spark of Imagination from Mimiron's area in Ulduar", zone = "Ulduar" },
    { text = "Restore Hati at the end of the questline", zone = "Storm Peaks / Ulduar" },
    { text = "Afterwards, Hati is tameable in 6 color variants at the Temple of Storms in the Storm Peaks", zone = "The Storm Peaks (Temple of Storms)" },
    { text = "Use the Essence Swapper toy to copy pet appearances onto Hati", zone = "Anywhere" },
  },
})

Add({
  id = "mardivas-laboratory", name = "Mardivas's Laboratory", type = "questline",
  expansion = "bfa", game = "retail", zone = "Nazjatar",
  reward = "Periodic Destruction achievement (weekly laboratory puzzle; verify any pet/mount reward mapping in the source guide)", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "Weekly lockout over multiple weeks",
  timeGate = "Weekly quest lockout", rng = "Arcane reagents are rare drops (e.g. Strange Volcanic Rocks)", prereq = "Nazjatar access",
  source = "https://www.wow-pro.com/nazjatar-horde/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Loot a Lesser Benthic Arcanocrystal from Nazjatar to start Legacy of the Mad Mage", zone = "Nazjatar" },
    { text = "Go to Mardivas's Laboratory (lab area, approximate)", zone = "Nazjatar", x = 60.3, y = 33.5 },
    { text = "Place the crystal and activate the Amalgamator - laboratory quest point", zone = "Nazjatar", x = 60.60, y = 33.02 },
    { text = "Laboratory quest point", zone = "Nazjatar", x = 60.27, y = 33.62 },
    { text = "Laboratory quest point", zone = "Nazjatar", x = 59.89, y = 33.88 },
    { text = "Laboratory quest point", zone = "Nazjatar", x = 59.79, y = 34.19 },
    { text = "Each week, combine small/large arcanocrystals with arcane reagents to summon elementals; defeat ALL combinations to earn Periodic Destruction", zone = "Nazjatar (Mardivas's Laboratory)" },
  },
})

Add({
  id = "mechagon-secrets", name = "Mechagon Secrets (set)", type = "questline",
  expansion = "bfa", game = "retail", zone = "Mechagon Island",
  reward = "Blueprint-crafted mounts/toys/colors: Mechagon Mechanostrider, Junkheap Drifter, Xiwyllag ATV paints, Mechanocat Laser Pointer colors, Secret Fish Goggles and more", mindSeeker = false,
  solo = "Solo (mostly)", difficulty = 3, estTime = "Daily/RNG components over days",
  timeGate = "Daily construction projects and rigs", rng = "Heavy daily/RNG components (e.g. Junkheap Drifter is an Arachnoid Harvester drop)", prereq = "Mechagon / Rustbolt access",
  source = "https://warcraft-secrets.com/guides/battle-for-azeroth-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Work the blueprint-driven crafting system in Rustbolt: collect blueprints and craft the Mechagon items - per-blueprint sources are in the Mechagon guides, not extracted in the research", zone = "Mechagon Island (Rustbolt)" },
    { text = "Mounts in the set: Mechagon Mechanostrider (crafted) and Junkheap Drifter (Arachnoid Harvester drop)", zone = "Mechagon Island" },
    { text = "Xiwyllag ATV: craft it and unlock its secret paint colors", zone = "Mechagon Island" },
    { text = "Mechanocat Laser Pointer: unlock its color options", zone = "Mechagon Island" },
    { text = "Complete the Secret Fish of Mechagon chain to earn the Secret Fish Goggles (continues in the Secret Fish entry)", zone = "Mechagon Island" },
    { text = "Run the Feedback / daily-rig construction projects and check the Wheelhouse and Charging Station for hidden objects", zone = "Mechagon Island" },
  },
})

Add({
  id = "secret-fish", name = "Secret Fish & Hyper-Compressed Ocean", type = "toy",
  collection = { kind = "toy", id = 168016 },
  expansion = "bfa", game = "retail", zone = "Mechagon > Azeroth-wide",
  reward = "Hyper-Compressed Ocean toy", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "Fishing across Azeroth",
  timeGate = "Elusive Moonfish only at night, Golden Sunsoaker only by day", rng = "A random fish spawns within 40 yards every 30 seconds; secret fish are a chance per catch",
  prereq = "Secret Fish Goggles (reward of Secret Fish of Mechagon: deliver ten fish to Danielle Anglers)",
  source = "https://warcraft-secrets.com/guides/the-secret-fish",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Earn the Secret Fish Goggles from Secret Fish of Mechagon (catch and deliver ten fish to Danielle Anglers)", zone = "Mechagon Island" },
    { text = "Common fish (8, any zone): farm them on a floating rock in Outland Nagrand - stand on one side and the fish spawn on the other", zone = "Nagrand (Outland)", x = 60.8, y = 91.0 },
    { text = "Ghost fish (Veiled Ghost, Spiritual Salmon, Quiet Floater, Deadeye Wally) only appear while you are dead - take the goggles buff first; the floating island south of Dalaran (Broken Isles) works well", zone = "Broken Isles" },
    { text = "Zone fish (1/3): Mechanized Mackerel - Mechagon; Jade Story Fish - Jade Forest; Kirin Tor Clown - either Dalaran; Barbed Fjord Fin - Howling Fjord; Prisoner Fish - Tol Barad; Thunderous Flounder - Isle of Thunder; Queen's Delight - Nazjatar", zone = "Azeroth-wide" },
    { text = "Zone fish (2/3): Ancient Mana Fin - Astravar Harbor, Suramar (fish from upstairs)", zone = "Suramar", x = 52.8, y = 69.5 },
    { text = "Drowned Goldfish - Drowned Lands from Deadwash, Stormsong Valley", zone = "Stormsong Valley", x = 46.0, y = 53.0 },
    { text = "Dead Fel Bone - Krokuun", zone = "Krokuun", x = 34.5, y = 76.5 },
    { text = "Rotted Blood Cod - Nazmir", zone = "Nazmir", x = 55.4, y = 57.9 },
    { text = "Tortollan Tank Dweller - the Drunk Tank, the underwater bar under Anyport", zone = "Drustvar", x = 19.5, y = 42.7 },
    { text = "Thin Air Flounder - Neverest Pinnacle (approach on foot, not flying)", zone = "Kun-Lai Summit", x = 44.5, y = 52.5 },
    { text = "Zone fish (3/3): Well Lurker - swim down in the Nordrassil lake, Mount Hyjal (approach on foot); Green Roughy - needs the Painted Green buff from the Mechanocat painting puddle at 63 42 in Mechagon; Displaced Scrapfin - Mechagon's Alternate Future", zone = "Mount Hyjal / Mechagon" },
    { text = "Catch all the fish for Secret Fish and Where to Find Them to earn the Hyper-Compressed Ocean toy", zone = "Azeroth-wide" },
  },
})

Add({
  id = "trashmaster", name = "Trashmaster", type = "title",
  expansion = "bfa", game = "retail", zone = "Dazar'alor (Horde) / Vol'dun (Alliance)",
  reward = "'Trashmaster' title + Richly Appointed Drape cloak", mindSeeker = false,
  solo = "Solo", difficulty = 2, estTime = "Mantle farm + short quests",
  timeGate = nil, rng = "Trashmaster's Mantle is a chance drop from K.U.-J.0. in Operation: Mechagon (a Seal of Wartorn Fate gives an extra roll on Mythic)",
  prereq = "Both factions can do it: Horde via Dazar'alor, Alliance via Vol'dun",
  source = "https://warcraft-secrets.com/guides/the-trashmaster-title",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Get the Trashmaster's Mantle: a chance drop from K.U.-J.0. in Operation: Mechagon", zone = "Operation: Mechagon" },
    { text = "Horde: start Pests with Nokano in Dazar'alor, then complete Curse of Jani", zone = "Dazar'alor", x = 40.2, y = 19.2 },
    { text = "Alliance: start Pests with Quartermaster Alfin in Vol'dun, then complete Curse of Jani", zone = "Vol'dun", x = 36.6, y = 32.4 },
    { text = "Horde: find Jani here (make sure Jani is NOT your active loa - change it with Chronicler Ash'tari at 50.7 35.3)", zone = "Dazar'alor", x = 35.4, y = 7.7 },
    { text = "Alliance: find Jani here", zone = "Vol'dun", x = 36.2, y = 36.8 },
    { text = "Give Jani the mantle in 'I Am the Trashmaster' - the title unlocks permanently for that character", zone = "Dazar'alor / Vol'dun" },
  },
})

Add({
  id = "wicker-pup", name = "Wicker Pup", type = "pet",
  collection = { kind = "pet", id = 2411 },
  expansion = "bfa", game = "retail", zone = "Drustvar",
  reward = "Wicker Pup pet", mindSeeker = true,
  solo = "Solo", difficulty = 2, estTime = "~20m",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/secret-battle-pets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Open the Hexed Chest in Drustvar and take its item (1 of 4)", zone = "Drustvar", mapID = 896, x = 18.5, y = 51.3 },
    { text = "Open the Ensorcelled Chest and take its item (2 of 4)", zone = "Drustvar", mapID = 896, x = 67.6, y = 73.6 },
    { text = "Open the Enchanted Chest and take its item (3 of 4)", zone = "Drustvar", mapID = 896, x = 25.6, y = 24.0 },
    { text = "Open the Bespelled Chest and take its item (4 of 4)", zone = "Drustvar", mapID = 896, x = 55.4, y = 51.5 },
    { text = "Combine the 4 items to create the Wicker Pup", zone = "Drustvar" },
  },
})

Add({
  id = "bumbles", name = "Bumbles", type = "pet",
  collection = { kind = "pet", id = 2442 },
  expansion = "bfa", game = "retail", zone = "Stormsong Valley / Boralus",
  reward = "Bumbles pet", mindSeeker = false,
  solo = "Solo", difficulty = 2, estTime = "7 days of feeding (plus questline)",
  timeGate = "Feed Bumbles daily for 7 days", rng = "Annealed Honey Amulet is farmed", prereq = "Alliance only (Let's Bee Friends)",
  source = "https://warcraft-secrets.com/guides/secret-battle-pets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Complete the Mildenhall questline (Let's Bee Friends) in Stormsong Valley", zone = "Stormsong Valley" },
    { text = "Farm the Annealed Honey Amulet", zone = "Stormsong Valley / Kul Tiras" },
    { text = "Find Rosaline at one of her 5 roaming points in Boralus (one point from the guide)", zone = "Boralus", x = 51.5, y = 48.0 },
    { text = "Meet Ancel in Boralus", zone = "Boralus", x = 68.8, y = 65.2 },
    { text = "Feed Bumbles once a day for 7 days to earn the pet", zone = "Boralus" },
  },
})

Add({
  id = "gem-of-acquiescence", name = "Gem of Acquiescence", type = "toy",
  collection = { kind = "toy", id = 161342 },
  expansion = "bfa", game = "retail", zone = "Boralus (Stormsong Monastery cave)",
  reward = "Gem of Acquiescence toy (invisible in the Toy Box until learned)", mindSeeker = false,
  solo = "Solo", difficulty = 1, estTime = "15 minutes",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/gem-of-acquiescence-hidden-toy",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Dive into the pool near the south-west entrance of the Stormsong Monastery island to find the underwater cave", zone = "Boralus", x = 61.5, y = 83.6 },
    { text = "Inside is the Ominous Altar (nothing to do yet)", zone = "Boralus", x = 55.7, y = 91.1 },
    { text = "Damp Scroll 1: by the skeleton's hand on the floor, left of the altar", zone = "Boralus", x = 56.0, y = 91.5 },
    { text = "Damp Scroll 2: down the stairs to the left, on the floor (a K'thir Occultist guards it)", zone = "Boralus", x = 61.2, y = 78.1 },
    { text = "Damp Scroll 3: up the stairs in the central building, on the floor by the bookshelf", zone = "Boralus", x = 63.0, y = 81.8 },
    { text = "Damp Scroll 4: down the stairs in the easternmost building, by a pile of books", zone = "Boralus", x = 71.0, y = 84.6 },
    { text = "Damp Scroll 5: under the wooden planks by a bookshelf", zone = "Boralus", x = 67.2, y = 79.8 },
    { text = "Return to the Ominous Altar and recite the five scroll lines in order to receive the toy (counts as 'Secret of the Depths' for Treasures of Tiragarde Sound)", zone = "Boralus", x = 55.7, y = 91.1 },
  },
})
