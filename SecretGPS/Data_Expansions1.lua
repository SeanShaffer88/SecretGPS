-- SecretGPS -- Retail data (expansions batch 1: older world, Legion, BfA)
-- Transcribed from the 2026-10-23 research report, sections 3.1-3.3.
-- Coordinates and IDs appear only where that report sourced them; entries
-- whose steps/coords were not extracted in the report say so honestly.
local _, ns = ...
ns.Entries = ns.Entries or {}
local function Add(e) ns.Entries[#ns.Entries + 1] = e end

Add({
  id = "time-lost-proto-drake", name = "Time-Lost Proto-Drake", type = "mount",
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
  expansion = "cata", game = "retail", zone = "Vashj'ir",
  reward = "Reins of Poseidus mount (Bind on Equip)", mindSeeker = false,
  status = "Evergreen rare camp",
  solo = "Solo", difficulty = 5, estTime = "Camp: long respawn, community-tracked",
  timeGate = nil, rng = "Rare patrol spawn, heavily camped historically", prereq = "Aquatic movement in Vashj'ir",
  source = "https://wowblues.com/rare-mounts-guide-collecting-coveted-mounts-in-world-of-warcraft/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Patrol for the rare seahorse Poseidus in Vashj'ir - exact spawn/patrol coordinates were not extracted in the research; see the source guide, do not rely on guessed points", zone = "Vashj'ir" },
    { text = "Kill Poseidus - the Reins of Poseidus drop 100%", zone = "Vashj'ir" },
  },
})

Add({
  id = "grey-riding-camel", name = "Grey Riding Camel", type = "mount",
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
  expansion = "wod", game = "retail", zone = "Draenor (all zones)",
  reward = "Voidtalon of the Dark Star mount", mindSeeker = false,
  status = "Evergreen rare camp",
  solo = "Solo", difficulty = 5, estTime = "Pure RNG search/camp",
  timeGate = nil, rng = "Edge of Reality portals spawn randomly, despawn after about 1h, and are single-use", prereq = nil,
  source = "https://warcraft-secrets.com/guides/warlords-of-draenor-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Search Draenor zones for an Edge of Reality portal - spawn points are numerous and were not listed in the research; see the source guide", zone = "Draenor" },
    { text = "Click the portal to enter the scenario", zone = "Edge of Reality scenario" },
    { text = "Loot the Voidtalon Egg in the scenario for the mount", zone = "Edge of Reality scenario" },
  },
})

Add({
  id = "terky", name = "Terky", type = "pet",
  expansion = "wod", game = "retail", zone = "Borean Tundra",
  reward = "Terky pet", mindSeeker = false,
  solo = "Solo", difficulty = 1, estTime = "Minutes once known",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/warlords-of-draenor-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Find the hidden cave in Borean Tundra - exact coordinates were not extracted in the research; see the source guide", zone = "Borean Tundra" },
    { text = "Loot the White Murloc Egg in the cave for Terky (originally an Asia iCoke promo pet, made worldwide in patch 6.2.2)", zone = "Borean Tundra" },
  },
})

Add({
  id = "pepe", name = "Pepe & Costumes", type = "toy",
  expansion = "wod", game = "retail", zone = "Garrison / Draenor + later zones",
  reward = "Trans-Dimensional Bird Whistle toy (Pepe) + costume collection", mindSeeker = false,
  solo = "Solo", difficulty = 2, estTime = "Varies per costume",
  timeGate = nil, rng = "Some costumes come from RNG or timed spawns", prereq = nil,
  source = "https://warcraft-secrets.com/guides/legion-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Find Pepe in Garrison / world spots and obtain the Trans-Dimensional Bird Whistle - per-spot coordinates are in the Pepe guide, not extracted in the research", zone = "Draenor + later zones" },
    { text = "WoD costumes (5): Scarecrow, Pirate, Viking, Plated Helm, Ninja", zone = "Draenor" },
    { text = "Legion costumes: Warglaives, Goggles, plus the Wooden Pepe bobber", zone = "Broken Isles" },
    { text = "Battle for Azeroth costumes (3): Clockwork Key, Voodoo Mask, Diving Helmet", zone = "Kul Tiras / Zandalar" },
    { text = "Dragonflight costumes (3): Dragon Goblet, Ear Warmer, Explorer's Hat", zone = "Dragon Isles" },
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
  expansion = "legion", game = "retail", zone = "Return to Karazhan",
  reward = "Smoldering Ember Wyrm mount", mindSeeker = false,
  solo = "Group (dungeon; soloable at max level)", difficulty = 3, estTime = "One dungeon run per attempt",
  timeGate = nil, rng = "Mount is a chance drop from Nightbane (drop rules historically improved by group composition - verify current rules in the source guide)", prereq = "Return to Karazhan dungeon access",
  source = "https://warcraft-secrets.com/guides/legion-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "In Return to Karazhan, complete the timed crystal clicks to summon the secret boss Nightbane - the exact click sequence and coordinates are in the source guide, not extracted in the research", zone = "Return to Karazhan" },
    { text = "Kill Nightbane for a chance at the Smoldering Ember Wyrm", zone = "Return to Karazhan" },
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
  expansion = "legion", game = "retail", zone = "Gnomeregan",
  reward = "Vial of Green Goo toy (from the hidden boss Endgineer Omegaplugg)", mindSeeker = false,
  solo = "Group (party recommended per the source hub)", difficulty = 3, estTime = "One dungeon run",
  timeGate = nil, rng = nil, prereq = "A party is recommended",
  source = "https://warcraft-secrets.com/guides/legion-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "In Gnomeregan, reach the hidden boss Endgineer Omegaplugg via the pillar button sequence - the exact sequence is in the source guide, not extracted in the research", zone = "Gnomeregan" },
    { text = "Kill Endgineer Omegaplugg for the Vial of Green Goo toy", zone = "Gnomeregan" },
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
  solo = "Solo", difficulty = 3, estTime = "Multi-day trading",
  timeGate = "Multi-day murloc trading game", rng = nil, prereq = "Unlock Mrrl via the Murkeye / bodyguard item chain; gold and item costs for trades",
  source = "https://warcraft-secrets.com/guides/battle-for-azeroth-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Unlock the secret murloc vendor Mrrl via the Murkeye / bodyguard item chain - chain details are in the source guide, not extracted in the research", zone = "Nazjatar" },
    { text = "Play the murloc trading game: buy low and sell high across the 5 murloc vendors over multiple days", zone = "Nazjatar" },
    { text = "Buy the Crimson Tidestallion and the other secret stash items from Mrrl (achievement: Mrrl's Secret Stash)", zone = "Nazjatar" },
  },
})

Add({
  id = "child-of-torcali", name = "Child of Torcali", type = "mount",
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
  expansion = "bfa", game = "retail", zone = "Mechagon > Azeroth-wide",
  reward = "Hyper-Compressed Ocean toy", mindSeeker = false,
  solo = "Solo", difficulty = 3, estTime = "Fishing across Azeroth",
  timeGate = nil, rng = "Fishing", prereq = "Secret Fish Goggles (from the Mechagon secret-fish achievement)",
  source = "https://warcraft-secrets.com/guides/battle-for-azeroth-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Earn the Secret Fish Goggles from the Mechagon secret-fish achievement (see the Mechagon Secrets entry)", zone = "Mechagon Island" },
    { text = "While wearing the goggles, catch the secret fish hidden across Azeroth - the per-fish list and coordinates are in the source guide, not extracted in the research", zone = "Azeroth-wide" },
    { text = "Complete the secret fish collection to earn the Hyper-Compressed Ocean toy", zone = "Azeroth-wide" },
  },
})

Add({
  id = "trashmaster", name = "Trashmaster", type = "title",
  expansion = "bfa", game = "retail", zone = "Zuldazar (Dazar'alor)",
  reward = "'Trashmaster' title", mindSeeker = false,
  solo = "Solo", difficulty = 2, estTime = "Short quest sequence",
  timeGate = nil, rng = nil, prereq = "Horde-leaning: Jani is a Horde loa (Alliance access is via the war campaign - verify in the source guide)",
  source = "https://warcraft-secrets.com/guides/battle-for-azeroth-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Loot a Mysterious Trashpile and take on Jani's trashpile tasks in Zuldazar - task details are in the source guide, not extracted in the research", zone = "Zuldazar" },
    { text = "Complete her steal-and-return quest sequence in Dazar'alor to earn the Trashmaster title", zone = "Dazar'alor" },
  },
})

Add({
  id = "wicker-pup", name = "Wicker Pup", type = "pet",
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
  expansion = "bfa", game = "retail", zone = "Boralus (Stormsong Monastery cave)",
  reward = "Gem of Acquiescence toy (invisible in the Toy Box until learned)", mindSeeker = false,
  solo = "Solo", difficulty = 1, estTime = "Minutes once found",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/battle-for-azeroth-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Find the hidden cave beneath the Stormsong Monastery in Boralus - exact coordinates were not extracted in the research; see the source guide", zone = "Boralus" },
    { text = "Loot the Gem of Acquiescence in the cave (it is part of Treasures of Tiragarde Sound as 'Secret of the Depths')", zone = "Boralus (hidden cave)" },
  },
})
