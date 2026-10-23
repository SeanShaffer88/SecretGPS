-- SecretGPS -- Retail data, expansions set 2 (Shadowlands / Dragonflight /
-- The War Within / Midnight). Transcribed from the 2026-10-23 research
-- report sections 3.4-3.7. Coordinates appear only where that report
-- sourced them; none of these sections gave a #mapID, so no step in this
-- file carries a mapID. Entries whose full step lists were not extracted
-- in the research pass say so in their steps instead of guessing.
local _, ns = ...
ns.Entries = ns.Entries or {}
local function Add(e) ns.Entries[#ns.Entries + 1] = e end

-- ===================== Shadowlands =====================

Add({
  id = "bound-shadehound", name = "Bound Shadehound", type = "mount",
  collection = { kind = "mount", id = 1441 },
  expansion = "shadowlands", game = "retail", zone = "The Maw",
  reward = "Bound Shadehound mount", mindSeeker = true,
  solo = "Solo", difficulty = 4, estTime = "Multi-part Maw chain",
  timeGate = nil, rng = nil, prereq = "Maw progression (Ve'nari) helps",
  source = "https://warcraft-secrets.com/guides/shadowlands-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Work through the Shadehound attunement chain in the Maw: gather the Mawsworn training items (summary per research report; full ordered list is in the source guide)", zone = "The Maw" },
    { text = "Complete the Beastwarrens hunts portion of the attunement", zone = "The Maw (Beastwarrens)" },
    { text = "Complete the forged shackles sequence", zone = "The Maw" },
    { text = "Finish the chain to gain the tameable/ridable shadehound mount", zone = "The Maw" },
    { text = "Honest gap: the full step list for this chain was not extracted in the research pass - follow the source guide step by step before starting", zone = "The Maw" },
  },
})

Add({
  id = "deepstar-aurelid", name = "Deepstar Aurelid (Hirukon)", type = "mount",
  collection = { kind = "mount", id = 1434 },
  expansion = "shadowlands", game = "retail", zone = "Zereth Mortis",
  reward = "Deepstar Aurelid mount (from Hirukon)",
  solo = "Solo", difficulty = 3, estTime = "Fishing RNG dependent",
  timeGate = nil, rng = "Strange Goo is a rare fishing catch", prereq = nil,
  source = "https://warcraft-secrets.com/guides/shadowlands-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Fish in Zereth Mortis waters until you catch the Strange Goo (rare)", zone = "Zereth Mortis" },
    { text = "Work through the Aurelid lure item chain via the fishing NPCs to build the lure for Hirukon", zone = "Zereth Mortis" },
    { text = "Use the lure to draw the rare Hirukon out of the deep water and defeat it", zone = "Zereth Mortis" },
    { text = "Loot the Deepstar Aurelid mount (high drop chance per source summary)", zone = "Zereth Mortis" },
  },
})

Add({
  id = "tahonta", name = "Bonehoof Tauralus", type = "mount",
  collection = { kind = "mount", id = 1366 },
  expansion = "shadowlands", game = "retail", zone = "Maldraxxus",
  reward = "Bonehoof Tauralus mount (drops from the rare elite Tahonta)",
  solo = "Solo", difficulty = 2, estTime = "Rare spawn camp",
  timeGate = nil, rng = "Necrolord covenant only: Abomination Factory rank 2, with the construct Neena accompanying the kill (per WarcraftMounts)", prereq = nil,
  source = "https://warcraft-secrets.com/guides/shadowlands-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Find and defeat the rare elite Tahonta in Maldraxxus for a chance at the mount", zone = "Maldraxxus" },
    { text = "Drop rules (per WarcraftMounts): you must be Necrolord with Abomination Factory rank 2, and the construct Neena must be accompanying you when Tahonta dies", zone = "Maldraxxus" },
  },
})

Add({
  id = "courage", name = "Courage", type = "pet",
  collection = { kind = "pet", id = 3065 },
  expansion = "shadowlands", game = "retail", zone = "Bastion",
  reward = "Courage pet (secret Larion cub)", mindSeeker = true,
  solo = "Group recommended: 5 players (3 can work with tight coordination)", difficulty = 3, estTime = "~15 min with a group",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/courage",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Head to Nemea's Retreat in Bastion. Nine Larion Cubs are scattered around the retreat (next steps). On a countdown, your party must interact with at least 5 cubs within 10 seconds - that makes Courage spawn briefly near Nemea, and someone must interact with him within 30 seconds", zone = "Bastion" },
    { text = "Larion Cub 1 - move on top of the pet bed to interact", zone = "Bastion", mapID = 1533, x = 56.91, y = 39.05 },
    { text = "Larion Cub 2 - move on top of the table to interact", zone = "Bastion", mapID = 1533, x = 57.36, y = 39.04 },
    { text = "Larion Cub 3 - requires jumping", zone = "Bastion", mapID = 1533, x = 57.75, y = 40.93 },
    { text = "Larion Cub 4", zone = "Bastion", mapID = 1533, x = 57.24, y = 39.85 },
    { text = "Larion Cub 5", zone = "Bastion", mapID = 1533, x = 57.45, y = 41.24 },
    { text = "Larion Cub 6", zone = "Bastion", mapID = 1533, x = 56.15, y = 40.12 },
    { text = "Larion Cub 7", zone = "Bastion", mapID = 1533, x = 56.05, y = 39.24 },
    { text = "Larion Cub 8", zone = "Bastion", mapID = 1533, x = 57.90, y = 39.02 },
    { text = "Larion Cub 9", zone = "Bastion", mapID = 1533, x = 56.73, y = 40.48 },
    { text = "Courage spawns here when the cubs are petted in time ('Courage hears the purring of his friends and demands pets!') - interact with him within 30 seconds to earn the pet", zone = "Bastion", mapID = 1533, x = 57.33, y = 39.36 },
    { text = "Mind-Seeker note: buying Courage on the Auction House does not light his Seat of Knowledge record - the record tracks solving the secret, so pet the cubs yourself", zone = "Bastion" },
  },
})

Add({
  id = "glimr", name = "Glimr", type = "pet",
  collection = { kind = "pet", id = 2888 },
  expansion = "shadowlands", game = "retail", zone = "Grizzly Hills",
  reward = "Glimr pet", mindSeeker = true,
  solo = "Solo", difficulty = 2, estTime = "~45 min",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/glimr",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Find the Glimmerfin Scout on top of an iceberg in southern Grizzly Hills. Approach him to scare him off, then pick up the Glimmerfin Scale he leaves behind (if he is absent, he respawns within about 5 minutes)", zone = "Grizzly Hills", mapID = 116, x = 18.4, y = 88.2 },
    { text = "Take the scale to King Mrgl-Mrgl in Borean Tundra - he hands you 3x Elixir of Water Breathing and the follow-up quest", zone = "Borean Tundra", mapID = 114, x = 43.5, y = 13.9 },
    { text = "Glimmerfin Welcome: kill Scuttleclaw Skimmers and Sandshells under the iceberg to loot 10x Meaty Crab Chunk, then deliver them to Glimmergut at the Glimmerfin camp (a shipwreck in the southern ocean)", zone = "Grizzly Hills", mapID = 116, x = 17.8, y = 93.2 },
    { text = "A Big Horkin' Task: kill Horker for a Pile of Blubberfat and bring it back to Glimmergut", zone = "Grizzly Hills", mapID = 116, x = 10.3, y = 85.1 },
    { text = "Seer of the Waves: Glimmergut sends you on to the Glimmerfin Oracle at the camp - hand over the blubberfat and take the Oracle's quests", zone = "Grizzly Hills" },
    { text = "Pearl in the Deeps: collect the Giant Pearl southwest of the camp, guarded by the sea serpent Gem-Eyes at the edge of the fatigue zone (an aquatic mount helps), and return it to the Oracle", zone = "Grizzly Hills", mapID = 116, x = 22.3, y = 93.0 },
    { text = "Trainer's Test: defeat Trainer Grrglin in a pet battle - his 3 aquatic pets fall easily to level 1 flying pets. Return to the Oracle and a murloc egg appears at the camp", zone = "Grizzly Hills", mapID = 116, x = 21.4, y = 88.7 },
    { text = "Wrap it Up: collect the three seaweed stalks (Young, Warm and Bulbous) from the fatigue zone east of the camp, among the electrically charged algae, and bring them to the Oracle so she can wrap the egg", zone = "Grizzly Hills" },
    { text = "Guardian of the Smallest: slay the Great Mua'kin, a level 60 elite makrura next to the ship debris east of the camp", zone = "Grizzly Hills", mapID = 116, x = 8.8, y = 91.1 },
    { text = "Return to the Glimmerfin Oracle one last time: the egg hatches and you receive Glimr's Cracked Egg - use it to learn Glimr", zone = "Grizzly Hills" },
  },
})

Add({
  id = "enlightened-hearthstone", name = "Enlightened Hearthstone", type = "toy",
  collection = { kind = "toy", id = 190196 },
  expansion = "shadowlands", game = "retail", zone = "Zereth Mortis",
  reward = "Enlightened Hearthstone toy", mindSeeker = true,
  solo = "Group: 6 players with the Sphere toy (anyone nearby can loot once the portal opens)", difficulty = 3, estTime = "~20 min once a group is formed",
  timeGate = nil, rng = "The Sphere of Enlightened Cogitation is a chance drop from The Enlightened paragon chest", prereq = "Sphere of Enlightened Cogitation toy - one for each of the six participating players",
  source = "https://warcraft-secrets.com/guides/enlightened-hearthstone",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Find five other players who own the Sphere of Enlightened Cogitation (a chance drop from The Enlightened paragon chest in Zereth Mortis). The six of you each stand on one of the six hexagonal pillars around the pool beneath the Forge of Afterlives, sit (/sit) and use the sphere - one player per pillar (next steps)", zone = "Zereth Mortis" },
    { text = "South pillar: sit and use the Sphere of Enlightened Cogitation", zone = "Zereth Mortis", x = 47.5, y = 57.0 },
    { text = "Southwest pillar: sit and use the Sphere", zone = "Zereth Mortis", x = 45.5, y = 55.3 },
    { text = "Northwest pillar: sit and use the Sphere", zone = "Zereth Mortis", x = 45.5, y = 51.8 },
    { text = "North pillar: sit and use the Sphere", zone = "Zereth Mortis", x = 47.5, y = 50.0 },
    { text = "Northeast pillar: sit and use the Sphere", zone = "Zereth Mortis", x = 49.6, y = 51.7 },
    { text = "Southeast pillar: sit and use the Sphere", zone = "Zereth Mortis", x = 49.6, y = 55.3 },
    { text = "With all six spheres active, a zone-wide emote announces 'The Ponderer's Portal has opened'. Head to the southern pillar and loot the Enlightened Hearthstone from the portal - anyone nearby can loot it, even players without a sphere. The portal has a 5-second cooldown after each player loots and stays up for several minutes", zone = "Zereth Mortis" },
  },
})

Add({
  id = "sorrowbane", name = "Sorrowbane", type = "transmog",
  expansion = "shadowlands", game = "retail", zone = "Maldraxxus (Theater of Pain area)",
  reward = "Sorrowbane (2H sword) + Harvester of Sorrow + Oonar's Arm pet",
  solo = "Solo", difficulty = 3, estTime = "Buff-item prep, then the pull",
  timeGate = nil, rng = nil, prereq = "Stack the documented buff items (world-quest/buff items and strength buffs; see source guide for the exact set)",
  source = "https://warcraft-secrets.com/guides/shadowlands-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Gather the documented buff items in Maldraxxus (the research summary notes the sequence involves buff snacks / world-quest buff items - the exact set is in the source guide)", zone = "Maldraxxus" },
    { text = "Stack the strength buffs until you meet the pull check", zone = "Maldraxxus" },
    { text = "Pull Sorrowbane from the stone to receive the weapon, the Harvester of Sorrow, and the Oonar's Arm pet", zone = "Maldraxxus, Theater of Pain" },
  },
})

Add({
  id = "night-fae-soulshapes", name = "Night Fae Soulshapes & Crittershapes", type = "form",
  expansion = "shadowlands", game = "retail", zone = "Ardenweald + Azeroth",
  reward = "Soulshape and Crittershape form collection (about 30 forms)",
  solo = "Solo", difficulty = 2, estTime = "Collection over time",
  timeGate = nil, rng = "Some forms are rare drops", prereq = "Night Fae covenant origin; post-Shadowlands cross-covenant collectibility needs verifying per source guide",
  source = "https://warcraft-secrets.com/guides/shadowlands-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Collect soulshape and crittershape forms from quests, rares, dungeons and vendors across Ardenweald and Azeroth (about 30 forms)", zone = "Ardenweald + Azeroth" },
    { text = "Change forms at Lady Muunn / Choofa in the Heart of the Forest", zone = "Heart of the Forest, Ardenweald" },
    { text = "Use the Seed of Renewed Souls toy to use your soulshape outside Ardenweald", zone = "Anywhere" },
  },
})

-- ===================== Dragonflight =====================

Add({
  id = "lizi", name = "Lizi, Thunderspine Tramper", type = "mount",
  collection = { kind = "mount", id = 1639 },
  expansion = "dragonflight", game = "retail", zone = "Ohn'ahran Plains",
  reward = "Lizi, Thunderspine Tramper mount",
  solo = "Solo", difficulty = 2, estTime = "Quest chain",
  timeGate = nil, rng = nil, prereq = "Maruuk Centaur standing for the quest chain",
  source = "https://news.blizzard.com/en-us/article/23891317/dragonflight-mounts-pets-and-more-await-in-the-dragon-isles",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Start the questline 'To Tame a Thunderspine' in the Ohn'ahran Plains", zone = "Ohn'ahran Plains" },
    { text = "Rescue and feed Lizi over several quests (including fruit gathering and helping the centaur)", zone = "Ohn'ahran Plains" },
    { text = "Finish the chain to receive Lizi as a mount", zone = "Ohn'ahran Plains" },
  },
})

Add({
  id = "traders-ottuks", name = "Trader's Ottuks (barter set)", type = "mount",
  collection = { kind = "mount", ids = { 1546, 1653, 1655, 1657, 1658, 1659 } },
  expansion = "dragonflight", game = "retail", zone = "Azure Span (Iskaara)",
  reward = "Trader's Ottuk mounts (barter, not gold)",
  solo = "Solo", difficulty = 3, estTime = "Dungeon drop dependent",
  timeGate = nil, rng = "Three dungeon-sourced barter items for the Ivory Ottuk", prereq = nil,
  source = "https://news.blizzard.com/en-us/article/23891317/dragonflight-mounts-pets-and-more-await-in-the-dragon-isles",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Ivory Trader's Ottuk, item 1: Thunderous Downburst Ring (Nokhud Offensive, Raging Tempest)", zone = "Nokhud Offensive" },
    { text = "Ivory Trader's Ottuk, item 2: Unstable Arcane Loop (Azure Vault, Leymor)", zone = "Azure Vault" },
    { text = "Ivory Trader's Ottuk, item 3: Platinum Star Band (Algeth'ar Academy, Vexamus/quest)", zone = "Algeth'ar Academy" },
    { text = "Barter the three items to Tattukiaka at Iskaara for the Ivory Trader's Ottuk", zone = "Iskaara, Azure Span" },
    { text = "Other Trader's Ottuks use raid-item barters (for example Terros's Captive Core) - see source guide for each variant", zone = "Iskaara, Azure Span" },
  },
})

Add({
  id = "ancient-salamanther", name = "Ancient Salamanther", type = "mount",
  collection = { kind = "mount", id = 1619 },
  expansion = "dragonflight", game = "retail", zone = "Forbidden Reach",
  reward = "Ancient Salamanther mount (rare drop)",
  solo = "Solo", difficulty = 5, estTime = "Heavy RNG camp",
  timeGate = "Zone rares have shared/biweekly lockout quirks post-10.1 per forum reports", rng = "Very low drop chance, shared across all Forbidden Reach rares", prereq = nil,
  source = "https://us.forums.blizzard.com/en/wow/t/zaralek-the-reach-forgotten-rares/1622981",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Farm the Forbidden Reach rare rotation - the Ancient Salamanther can drop from any rare in the zone at a very low rate", zone = "Forbidden Reach" },
    { text = "Note: post-10.1 the Reach rares sit on shared/biweekly lockout quirks, so kills per week are limited - plan the camp accordingly", zone = "Forbidden Reach" },
  },
})

Add({
  id = "zskera-vaults", name = "Forbidden Reach & Zskera Vaults", type = "questline",
  expansion = "dragonflight", game = "retail", zone = "Forbidden Reach",
  reward = "Vault rewards: mounts (incl. mossy mammoth via vault items), pets, Onyx Annulet primordial stones, transmog",
  solo = "Solo", difficulty = 3, estTime = "Weekly cadence",
  timeGate = "Vault contents reset weekly and differ each week", rng = "Randomized vault doors", prereq = nil,
  source = "https://warcraft-secrets.com/guides/dragonflight-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Farm Zskera Vault Keys from Forbidden Reach rares and treasures", zone = "Forbidden Reach" },
    { text = "Spend keys opening doors inside the Zskera Vaults - contents are randomized and reset weekly", zone = "Zskera Vaults, Forbidden Reach" },
    { text = "Collect the vault rewards across weeks: mounts (the mossy mammoth comes from vault items), pets, Onyx Annulet primordial stones, and transmog", zone = "Zskera Vaults, Forbidden Reach" },
  },
})

Add({
  id = "druid-forms-dragonflight", name = "Druid Forms: Emerald Dream (10.2)", type = "form",
  expansion = "dragonflight", game = "retail", zone = "Emerald Dream",
  reward = "Druid form customizations (marks/glyphs)",
  solo = "Solo", difficulty = 3, estTime = "Collection over time",
  timeGate = nil, rng = "Some marks are rare drops", prereq = "Druid",
  source = "https://warcraft-secrets.com/guides/dragonflight-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Collect marks and glyphs from Emerald Dream rares, treasures and quests - examples from the research report: the Nah'qi spirit owl (also a hunter spirit beast at Amirdrassil), Runebear, Moon Owl, and Stag/Doe variants", zone = "Emerald Dream" },
    { text = "Apply the forms at the Rostrum of Transformation", zone = "Rostrum of Transformation" },
  },
})

Add({
  id = "warlock-demon-customizations", name = "Warlock Demon Customizations", type = "form",
  expansion = "dragonflight", game = "retail", zone = "Azeroth-wide",
  reward = "Warlock demon customizations (Barbershop)",
  solo = "Solo", difficulty = 2, estTime = "Collection over time",
  timeGate = nil, rng = "Some grimoires are drops", prereq = "Warlock",
  source = "https://warcraft-secrets.com/guides/dragonflight-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Collect grimoires from drops, quests and vendors across Azeroth to unlock demon skins (Imp, Felhunter, Voidwalker, Succubus/Incubus, Wrathguard, and more per the source guide)", zone = "Azeroth-wide" },
    { text = "Apply unlocked demon appearances at the Barbershop", zone = "Barbershop" },
  },
})

Add({
  id = "phoenix-wishwing", name = "Phoenix Wishwing", type = "pet",
  collection = { kind = "pet", id = 3292 },
  expansion = "dragonflight", game = "retail", zone = "Waking Shores",
  reward = "Phoenix Wishwing pet", mindSeeker = true,
  solo = "Solo", difficulty = 2, estTime = "See guide",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/secret-battle-pets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Start the hidden quest 'Tale of the Phoenix' from Tarjin the Blind in the Waking Shores", zone = "Waking Shores" },
    { text = "Complete the multi-step phoenix story to earn the Phoenix Wishwing (per-step detail is in the source guide)", zone = "Waking Shores" },
  },
})

Add({
  id = "nelthara", name = "Nelthara", type = "pet",
  collection = { kind = "pet", id = 3553 },
  expansion = "dragonflight", game = "retail", zone = "Valdrakken / High Creche",
  reward = "Nelthara pet",
  solo = "Solo", difficulty = 2, estTime = "Short quest chain",
  timeGate = nil, rng = nil, prereq = "Dracthyr Evoker only, Augmentation specialization",
  source = "https://warcraft-secrets.com/guides/secret-battle-pets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "As an Augmentation Evoker, take the quest 'Our Destiny'", zone = "Valdrakken" },
    { text = "Complete 'The High Creche': disrupt 4 Essence Collectors", zone = "High Creche" },
    { text = "Complete 'Augmenting a Dragon': subdue Adamanthia with Ebyssian to earn Nelthara", zone = "High Creche" },
  },
})

Add({
  id = "lost-obsidian-cache", name = "Lost Obsidian Cache: Black Dragon's Challenge Dummy", type = "toy",
  collection = { kind = "toy", id = 201933 },
  expansion = "dragonflight", game = "retail", zone = "Waking Shores",
  reward = "Black Dragon's Challenge Dummy toy", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "See guide",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/dragonflight-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Complete the assemble/interact sequence in the Obsidian area of the Waking Shores to open the Lost Obsidian Cache (the exact sequence is in the source guide)", zone = "Waking Shores" },
    { text = "Loot the Black Dragon's Challenge Dummy toy - this secret counts toward Mind-Seeker", zone = "Waking Shores" },
  },
})

Add({
  id = "alarashinu", name = "Alara'shinu", type = "transmog",
  expansion = "dragonflight", game = "retail", zone = "Emerald Dream",
  reward = "Alara'shinu (Demon Hunter warglaive appearance)",
  solo = "Solo", difficulty = 3, estTime = "Secret questline",
  timeGate = nil, rng = nil, prereq = "Demon Hunter only",
  source = "https://warcraft-secrets.com/guides/dragonflight-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Complete the secret Demon Hunter questline in the Emerald Dream (10.2) per the source guide", zone = "Emerald Dream" },
    { text = "Earn Alara'shinu - the glaive leaves flower trails on movement abilities", zone = "Emerald Dream" },
  },
})

Add({
  id = "ancient-revivals", name = "Ancient Secrets Revivals: Naxx / Scholo / ZG / Scarlet", type = "questline",
  expansion = "dragonflight", game = "retail", zone = "Eastern Plaguelands / Western Plaguelands / Stranglethorn",
  reward = "Restored legacy content: Tier 3 crafting and Reins of Valiance (Naxxramas), original Scholomance, Zul'Gurub recipes/ensembles and Brazier of Madness toy, Scarlet Monastery of Old",
  solo = "Solo", difficulty = 3, estTime = "Long-tail legacy farming",
  timeGate = nil, rng = nil, prereq = "Significant gold/material costs for Tier 3 crafting",
  source = "https://warcraft-secrets.com/guides/dragonflight-secrets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Scholomance: complete the Memory of Scholomance (Eva's Journal ritual) to unlock the original Scholomance", zone = "Western Plaguelands" },
    { text = "Naxxramas: complete 'Wards of the Dread Citadel' and empower an Argent Dawn Commission to open the portal - inside: Tier 3 crafting, Glacial sets, and the Reins of Valiance mount", zone = "Eastern Plaguelands" },
    { text = "Zul'Gurub: complete 'Relics of a Fallen Empire' for the Brazier of Madness toy, lost recipes and ensembles", zone = "Stranglethorn" },
    { text = "Scarlet Monastery: obtain the Scarlet Key to enter the Scarlet Monastery of Old", zone = "Tirisfal Glades" },
  },
})

-- ===================== The War Within =====================

Add({
  id = "voidfire-deathcycle", name = "Voidfire Deathcycle", type = "mount",
  collection = { kind = "mount", id = 1948 },
  expansion = "tww", game = "retail", zone = "Horrific Visions Revisited (Stormwind / Orgrimmar) > Dornogal",
  reward = "Voidfire Deathcycle mount", mindSeeker = true,
  solo = "Solo", difficulty = 4, estTime = "Multi-week (rotation-gated)",
  timeGate = "Components rotate weekly between the two Horrific Visions", rng = nil, prereq = nil,
  source = "https://blizzardwatch.com/2024/10/09/six-challenging-mounts-collect-war-within/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Collect bike components across the Stormwind and Orgrimmar Horrific Visions (11.1.5) - availability rotates weekly, for example the Void-Forged Engine Block in the Orgrimmar vision engineering shop on its rotation week", zone = "Horrific Visions (Stormwind / Orgrimmar)" },
    { text = "Obtain the profession-crafted parts (such as Goblin-Machined Pistons and wiring - these are buyable)", zone = "Auction House / professions" },
    { text = "Assemble the bike in Dornogal to receive the Voidfire Deathcycle", zone = "Dornogal" },
    { text = "Honest gap: the component details in the research pass rest on secondary guides of low authority - confirm the full component list against a current Wowhead / Warcraft Secrets guide before farming", zone = "Dornogal" },
  },
})

Add({
  id = "thrayir", name = "Thrayir, Eyes of the Siren", type = "mount",
  collection = { kind = "mount", id = 2322 },
  expansion = "tww", game = "retail", zone = "Siren Isle",
  reward = "Thrayir, Eyes of the Siren mount", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "Days",
  timeGate = nil, rng = "Runekeys come from chests, rares and ghosts", prereq = "Siren Isle progression (Seafury Tempest phase via Suzie Boltwrench)",
  source = "https://www.thegamer.com/world-of-warcraft-wow-war-within-thrayir-eyes-of-the-siren-mount-runekeys/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Collect the 5 Runekeys on Siren Isle - Cyclonic, Whirling, Thunderous, Torrential and Turbulent - from chests, rares and ghosts (key locations per source guide)", zone = "Siren Isle" },
    { text = "Progress the island until Suzie Boltwrench can put you into the Seafury Tempest phase", zone = "Siren Isle" },
    { text = "Enter the Forgotten Vault (east chamber, reached via the Sacred Hollow on the north shore)", zone = "Siren Isle" },
    { text = "Place the 5 Runekeys at the 5 runestones around Thrayir to revive it", zone = "Forgotten Vault, Siren Isle" },
    { text = "Accept and complete the follow-up quest to receive Thrayir", zone = "Forgotten Vault, Siren Isle" },
  },
})

Add({
  id = "beledars-spawn", name = "Beledar's Spawn", type = "mount",
  collection = { kind = "mount", id = 2192 },
  expansion = "tww", game = "retail", zone = "Hallowfall",
  reward = "Beledar's Spawn mount (rare drop)",
  solo = "Solo", difficulty = 4, estTime = "3-hour phase cycle, repeated kills",
  timeGate = "Beledar shifts to void phase every 3 hours; the rare appears at 1 of 20 locations", rng = "Low-percentage mount drop", prereq = "Renown 23 with the Hallowfall Arathi unlocks Beledar's Attunement, which marks the spawn on the map",
  source = "https://blizzardwatch.com/2024/10/09/six-challenging-mounts-collect-war-within/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Be in Hallowfall when Beledar shifts to its void phase (every 3 hours) - the rare Spawn of Beledar appears at one of 20 possible locations", zone = "Hallowfall" },
    { text = "Optional but strongly recommended: reach Renown 23 with the Hallowfall Arathi for Beledar's Attunement so the spawn is marked on your map", zone = "Hallowfall" },
    { text = "Kill the Spawn of Beledar for a low-percentage chance at the mount; raid groups commonly form for each phase", zone = "Hallowfall" },
    { text = "Honest gap: the 20 spawn points are not listed in the research report - they are a data list to take from the Wowhead guide at transcription time", zone = "Hallowfall" },
  },
})

Add({
  id = "siesbarg", name = "Siesbarg", type = "mount",
  collection = { kind = "mount", id = 2222 },
  expansion = "tww", game = "retail", zone = "Azj-Kahet",
  reward = "Siesbarg mount",
  solo = "Solo", difficulty = 5, estTime = "One of the longest grinds in The War Within",
  timeGate = nil, rng = "Tka'ktath has a roughly 6-hour spawn timer", prereq = nil,
  source = "https://blizzardwatch.com/2024/10/09/six-challenging-mounts-collect-war-within/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Kill the rare Tka'ktath (northeast of the City of Threads, roughly 6-hour spawn) to start the quest via the Vial of Tka'ktath's Blood", zone = "Azj-Kahet" },
    { text = "Farm 1,500 chitin from nerubians/ascended in Azj-Kahet", zone = "Azj-Kahet" },
    { text = "Farm 1,000 venom from nerubians/ascended", zone = "Azj-Kahet" },
    { text = "Farm 500 blood from nerubians/ascended and complete the quest for Siesbarg", zone = "Azj-Kahet" },
  },
})

Add({
  id = "alunira", name = "Alunira", type = "mount",
  collection = { kind = "mount", id = 2176 },
  expansion = "tww", game = "retail", zone = "Isle of Dorn",
  reward = "Alunira mount (high drop chance once her shield is broken)",
  solo = "Solo", difficulty = 4, estTime = "Shard farm dependent",
  timeGate = nil, rng = "Crackling Shards are rare drops zone-wide", prereq = "10 Crackling Shards to break Alunira's shield",
  source = "https://blizzardwatch.com/2024/10/09/six-challenging-mounts-collect-war-within/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Collect 10 Crackling Shards from rare drops across the Isle of Dorn", zone = "Isle of Dorn" },
    { text = "Use the shards to break the rare storm elemental Alunira's shield", zone = "Isle of Dorn" },
    { text = "Kill Alunira - the mount is a high-chance drop once the shield is broken", zone = "Isle of Dorn" },
  },
})

Add({
  id = "earthen-unlock", name = "Earthen Unlock & Slatestone Ramolith", type = "questline",
  expansion = "tww", game = "retail", zone = "Khaz Algar",
  reward = "Earthen allied race unlock + Slatestone Ramolith racial mount (Ordinant's Ramolith variant for Earthen Paladins)",
  solo = "Solo", difficulty = 2, estTime = "Campaign-length",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://gamerant.com/wow-the-war-within-how-unlock-earthen/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Complete the Khaz Algar leveling campaign in all 4 zones", zone = "Khaz Algar" },
    { text = "Complete the level-80 campaign (all factions at Renown 4)", zone = "Khaz Algar" },
    { text = "Side chain 1: 'Before I Depart' at Fallside Outpost", zone = "Isle of Dorn" },
    { text = "Side chain 2: 'Discarded and Broken' in the Ringing Deeps", zone = "Ringing Deeps" },
    { text = "Side chain 3: 'How Scandalous!' in Dornogal", zone = "Dornogal" },
    { text = "Earn the 'Allied Races: Earthen' achievement to unlock the race and its racial mount", zone = "Khaz Algar" },
  },
})

Add({
  id = "delve-secrets", name = "Delve Secrets & Customizations (set)", type = "questline",
  expansion = "tww", game = "retail", zone = "Delves (Khaz Algar, Undermine, K'aresh)",
  reward = "Delver's Dirigible customizations, Zekvir nemesis rewards (gold dirigible skin), Gob-trotter, Reshii Wraps phase-diving access",
  solo = "Solo", difficulty = 3, estTime = "Season-long collection",
  timeGate = nil, rng = nil, prereq = "Delves scale for 1-5 players",
  source = "https://blizzardwatch.com/2024/10/09/six-challenging-mounts-collect-war-within/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Collect Delver's Dirigible customizations hidden inside delves across Khaz Algar", zone = "Delves, Khaz Algar" },
    { text = "Defeat the nemesis Zekvir for its rewards (the gold dirigible skin comes from the 'Let Me Solo Him'-style achievement)", zone = "Zekvir's delve" },
    { text = "Work the Season 2 delve content: the Undermine delve and the Gob-trotter", zone = "Undermine" },
    { text = "Complete the K'aresh delves and earn the Reshii Wraps - the phase-diving secrets behind them are also the prerequisite for the Unfazed Diver pet (see its Midnight entry)", zone = "K'aresh" },
  },
})

Add({
  id = "undermine-treasures", name = "Undermine Treasures: Worldsoul Searching", type = "achievement",
  expansion = "tww", game = "retail", zone = "Undermine",
  reward = "Worldsoul Searching meta-achievement (mount reward per source tables: Jani's Trashpile)",
  solo = "Solo", difficulty = 2, estTime = "15 micro-puzzles",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://www.method.gg/guides/mounts/worldsoul-searching-the-war-within-meta-achievement-guide",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Suspicious Book: click the book, then click it again on each of the 3 successive floors", zone = "Undermine", x = 49.85, y = 66.24 },
    { text = "Lonely Tub: use the fire extinguisher on it", zone = "Undermine", x = 59.37, y = 19.11 },
    { text = "Fireworks Hat: chase down the hat after it lands", zone = "Undermine", x = 57.85, y = 52.68 },
    { text = "Complete the remaining hidden treasures - 15 in total, each a small micro-puzzle; the full 15-point list with coordinates is in the source (Method) guide", zone = "Undermine" },
  },
})

Add({
  id = "xy-trustees-gearglider", name = "Xy Trustee's Gearglider", type = "mount",
  collection = { kind = "mount", id = 1482 },
  expansion = "tww", game = "retail", zone = "Zereth Mortis / Korthia-era content (Cartel Xy)",
  reward = "Xy Trustee's Gearglider mount", mindSeeker = true,
  solo = "Solo", difficulty = 3, estTime = "See guide",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://warcraft-secrets.com/guides/mind-seeker",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "This Mind-Seeker-listed secret is tied to Cartel Xy cypher/reputation interactions in Zereth Mortis / Korthia-era content", zone = "Zereth Mortis / Korthia" },
    { text = "Honest gap: the full step list was not extracted in the research pass - this entry confirms the mount, its Mind-Seeker status and its Cartel Xy theme only. Follow the Warcraft Secrets guide for the sequence", zone = "Zereth Mortis / Korthia" },
  },
})

-- ===================== Midnight =====================

Add({
  id = "gortham", name = "Gortham", type = "pet",
  collection = { kind = "pet", id = 4967 },
  expansion = "midnight", game = "retail", zone = "Nexus-Point Xenas (dungeon)",
  reward = "Gortham pet (capybara)", mindSeeker = true,
  solo = "Group: full party of 5 (one player per conduit)", difficulty = 3, estTime = "~20 min",
  timeGate = nil, rng = nil, prereq = "Level 90 character and a full group of five players",
  source = "https://warcraft-secrets.com/guides/gortham",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Enter the Nexus-Point Xenas dungeon (any difficulty) with a full group of five level 90 characters and clear the trash leading up to Chief Corewright Kasreth", zone = "Nexus-Point Xenas" },
    { text = "Locate the five Corespark Conduits around the area and assign one player to each conduit (the source guide's map shows the five positions)", zone = "Nexus-Point Xenas" },
    { text = "Start a countdown and have all five players step onto their conduits at the same time. Done correctly, two emotes fire - 'The Engineway's pipes quake and rupture...' and 'A strange device unlodges from the center pipe!' - and a Netherstorm Structural Cage appears on top of a nearby pipe", zone = "Nexus-Point Xenas" },
    { text = "Interact with the cage to obtain Gortham and the You Conduit! achievement", zone = "Nexus-Point Xenas" },
  },
})

Add({
  id = "jimothy", name = "J'imothy", type = "pet",
  collection = { kind = "pet", id = 5164 },
  expansion = "midnight", game = "retail", zone = "Silvermoon City",
  reward = "J'imothy pet (raccoon)",
  solo = "Solo", difficulty = 2, estTime = "~10 min",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://blizzardwatch.com/2026/08/28/hunt-jimothy-officially-kicks-off-midnight-patch-12-1/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "J'imothy appears as an Ensorcelled Cryptid trapped in an arcane prison at one of three spots in Silvermoon City (the source guide describes the locations; it publishes no coordinates). Spot 1: inside the dwelling on the northwest outskirts of the city, past the university", zone = "Silvermoon City" },
    { text = "Spot 2: the northeast quadrant of the city (Lithiel's Landing), under a bridge", zone = "Silvermoon City" },
    { text = "Spot 3: at the very end of Murder Row, just above its label on the map", zone = "Silvermoon City" },
    { text = "Click the magical barrier surrounding him and channel the release spell while avoiding the falling orbs. Once the prison breaks you receive a Stubby Whistle, which teaches the J'imothy pet", zone = "Silvermoon City" },
  },
})

Add({
  id = "slitherfang", name = "Slitherfang", type = "pet",
  collection = { kind = "pet", id = 5129 },
  expansion = "midnight", game = "retail", zone = "Altar of Fangs (dungeon)",
  reward = "Slitherfang pet (snake) + 'In Case Of Emergency' achievement",
  solo = "Group: 5", difficulty = 3, estTime = "One dungeon run with a full group",
  timeGate = nil, rng = nil, prereq = "Group of exactly 5 inside the dungeon",
  source = "https://warcraft-secrets.com/guides/secret-battle-pets",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Bring a group of 5 into the Altar of Fangs dungeon", zone = "Altar of Fangs" },
    { text = "Reverse the ritual that was performed on Slitherfang inside the dungeon (ritual steps per the source guide)", zone = "Altar of Fangs" },
    { text = "Claim Slitherfang - the ritual also awards the 'In Case Of Emergency' achievement", zone = "Altar of Fangs" },
  },
})

Add({
  id = "unfazed-diver", name = "Unfazed Diver", type = "pet",
  collection = { kind = "pet", id = 4860 },
  expansion = "midnight", game = "retail", zone = "Tazavesh > K'aresh / Voidstorm / Naigtal",
  reward = "Unfazed Diver pet (purrkin)",
  solo = "Solo", difficulty = 4, estTime = "Trail across three areas (the hunt itself took the community about 10 months)",
  timeGate = nil, rng = nil, prereq = "Level 90 and the Reshii Wraps (K'aresh campaign)",
  source = "https://blizzardwatch.com/2026/06/30/how-to-get-unfazed-diver-pet/",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Meet the prerequisites: level 90, and the Reshii Wraps from the K'aresh campaign (this pet sat in the files from 11.2 with journal source '???' until it was solved in June 2026)", zone = "K'aresh" },
    { text = "Phase-dive at the Tazavesh conduit and read the note by the door", zone = "Tazavesh" },
    { text = "Follow the trail of lost Ethereum shipments across K'aresh, Voidstorm and Naigtal (waypoints per the source guide)", zone = "K'aresh / Voidstorm / Naigtal" },
    { text = "Reach the end of the trail and capture the Unfazed Diver", zone = "Naigtal" },
  },
})

Add({
  id = "labyrinth-of-kindojan", name = "Labyrinth of Kindo'jan (delve mount)", type = "mount",
  collection = { kind = "mount", id = 3144 },
  expansion = "midnight", game = "retail", zone = "Labyrinth of Kindo'jan (Eversong Woods entrance)",
  reward = "Loa-Blessed Wayfarer mount + related titles/achievements",
  solo = "Solo", difficulty = 4, estTime = "Endgame delve progression to Tier 11",
  timeGate = nil, rng = nil, prereq = "Intro quest from Kul'amara the Feral; endgame delve gearing for Tier 11",
  source = "https://wow.gg/guides/labyrinth-of-kindojan",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Enter the Labyrinth of Kindo'jan - the entrance is in Eversong Woods", zone = "Eversong Woods", x = 63.0, y = 72.2 },
    { text = "Take the intro quest from Kul'amara the Feral and complete the tutorial run with Valeera - full access is warband-wide per the video guide", zone = "Labyrinth of Kindo'jan" },
    { text = "Progress through the delve's 9 chambers, raising your tier as your gear allows", zone = "Labyrinth of Kindo'jan" },
    { text = "Defeat Kindo'jan solo on Tier 11 to earn the Loa-Blessed Wayfarer (name confirmed against WarcraftMounts and the Icy-Veins Midnight mount list)", zone = "Labyrinth of Kindo'jan" },
    { text = "Related Labyrinth goals (per source guides): Maze Runner title (all 9 chambers in one Tier 11 run), Treasure Hound (all 44 Sturdy Chests), Lockpickin' (open the hidden locked door 20 times), Lone Raider (deathless solo Tier 11)", zone = "Labyrinth of Kindo'jan" },
  },
})

Add({
  id = "gold-sink-mount", name = "Sporebearer Fungal Strider", type = "mount",
  collection = { kind = "mount", id = 3137 },
  expansion = "midnight", game = "retail", zone = "Harandar (vendor near the portals)",
  reward = "Sporebearer Fungal Strider - customizable 5,000,000 gold mount with auction house / transmog utility options",
  solo = "Solo", difficulty = 1, estTime = "One purchase (plus the gold)",
  timeGate = nil, rng = nil, prereq = "5,000,000 gold for the mount itself; utility add-ons 1,500,000 (auction house) + 500,000 (transmogrifier) per WarcraftMounts",
  source = "https://www.mmogah.com/news/wow/what-to-do-in-wow-midnight-1215",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Go to the vendor in Harandar, near the portals", zone = "Harandar" },
    { text = "Buy the mount for 5,000,000 gold - this price is corroborated by two sources in the research pass", zone = "Harandar" },
    { text = "UNVERIFIED: one single source (MMOGah) reports the two service features (auction house and transmog utility) cost a further 2,000,000 gold in total, for 7,000,000 all-in. That split is single-source - verify the prices at the vendor before relying on them", zone = "Harandar" },
  },
})

Add({
  id = "housing-collectibles", name = "Housing Collectibles (system)", type = "housing",
  expansion = "midnight", game = "retail", zone = "Neighborhoods / Azeroth",
  reward = "Housing decor collection (quest, profession, achievement and vendor sources)",
  solo = "Solo", difficulty = 1, estTime = "Ongoing system, not a single secret",
  timeGate = nil, rng = nil, prereq = nil,
  source = "https://en.wikipedia.org/wiki/World_of_Warcraft:_Midnight",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "This is a system entry, not a puzzle: Midnight housing decor is earned through quests, professions, achievements, vendors, and premium currency", zone = "Neighborhoods / Azeroth" },
    { text = "Architectural styles at launch: Orc, Human, Blood Elf and Night Elf. Neighborhood Endeavours activities unlock further decor", zone = "Neighborhoods" },
    { text = "SecretGPS treats decor as a collectible type with source tracking rather than waypoint puzzles - except where a decor item is itself a secret reward (for example the Labyrinth of Kindo'jan decor in the Labyrinth entry's source guides)", zone = "Azeroth" },
  },
})

Add({
  id = "midnight-skyriding-glyphs", name = "Midnight Skyriding Glyphs: Crimson Dragonhawk", type = "mount",
  collection = { kind = "mount", id = 2756 },
  expansion = "midnight", game = "retail", zone = "Midnight zones + Coiled Isle",
  reward = "Crimson Dragonhawk mount (glyph collection)",
  solo = "Solo", difficulty = 2, estTime = "Fly-through collection across all Midnight zones",
  timeGate = nil, rng = nil, prereq = "Skyriding",
  source = "https://www.icy-veins.com/wow/midnight-skyriding-glyphs",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Fly through every skyriding glyph in each Midnight zone, including the Coiled Isle glyphs added in 12.1", zone = "Midnight zones + Coiled Isle" },
    { text = "Per-glyph locations are in the Icy Veins maps guide (updated for 12.1) - this entry does not reproduce the glyph coordinates", zone = "Midnight zones" },
    { text = "Complete the full glyph collection for the Crimson Dragonhawk", zone = "Midnight zones" },
  },
})

Add({
  id = "incognitro-midnight", name = "Incognitro: Midnight Continuation (Orbs 10-12)", type = "transmog",
  expansion = "midnight", game = "retail", zone = "Hallowfall + Azeroth",
  reward = "Oddsight Focus (item) + Radiant Singer Feat of Strength + Ensemble: Fashion of the Fanatic Felcyclist",
  solo = "Solo", difficulty = 5, estTime = "Continuation of the Incognitro chain",
  timeGate = nil, rng = nil, prereq = "Incognitro, the Indecipherable Felcycle (see its War Within entry)",
  source = "https://warcraft-secrets.com/guides/mind-seeker",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Continue the Incognitro puzzle in Midnight with Orbs 10-12 - the continuation and its three rewards are confirmed by the Warcraft Secrets Mind-Seeker guide", zone = "Hallowfall + Azeroth" },
    { text = "Orb rewards across the continuation: the Oddsight Focus item, the Radiant Singer Feat of Strength, and the Ensemble: Fashion of the Fanatic Felcyclist", zone = "Azeroth" },
    { text = "UNVERIFIED DETAIL: the reported final step - a 40-player synchronized emote dance at the Divine Flame of Beledar in Hallowfall, using the Oddsight Focus buff and coordinated via an addon - rests on a single low-authority report in the research pass. Treat the dance mechanic as unconfirmed; the continuation and rewards above are the confirmed part", zone = "Hallowfall" },
  },
})
