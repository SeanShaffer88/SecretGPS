-- SecretGPS: WoW: Forever exclusive secrets, part 2 (report section 3.8).
-- Facts transcribed only from the research report. None of these
-- entries have coordinates in the report; x/y are omitted throughout.
-- All Forever entries must be re-verified on the live Nov 4 build.
local _, ns = ...
ns.Entries = ns.Entries or {}
local function Add(e) ns.Entries[#ns.Entries + 1] = e end

Add({
    id = "rockslicer",
    name = "Rockslicer",
    type = "forever_item",
    expansion = "forever",
    game = "forever",
    zone = "The Deadmines",
    reward = "Rockslicer (2H axe) - harvests Copper/Tin/Silver/Iron veins without the Mining profession",
    solo = false,
    prereq = "Level 18; group dungeon (era-appropriate 5-player); solo at cap per report",
    status = "BETA-EARNED",
    source = "https://wowdb.wiki/forever/guides/secrets-and-hidden-quests",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Enter The Deadmines (level 18 content; era-appropriate group of 5, or solo at cap).", zone = "The Deadmines" },
        { text = "Kill Rhahk'Zor and loot Rockslicer.", zone = "The Deadmines" },
        { text = "Use the axe to harvest Copper, Tin, Silver and Iron veins without having the Mining profession.", zone = "The Deadmines" },
    },
})

Add({
    id = "first-mate-band",
    name = "First Mate Band + Partners in Crime",
    type = "forever_item",
    expansion = "forever",
    game = "forever",
    zone = "The Deadmines",
    reward = "First Mate Band (ring); at level 60 it pairs with Band of the Better Half as the Partners in Crime set: wearing both gives +20 Strength and a chance to become Angry (+50 Strength)",
    solo = false,
    prereq = "Level 17; dungeon group (Mr. Smite, The Deadmines); set completion requires level 60",
    status = "BETA-EARNED (band) / FILES-ONLY (set completion)",
    source = "https://wowdb.wiki/forever/guides/secrets-and-hidden-quests",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Run The Deadmines (level 17) and loot the First Mate Band from Mr. Smite. The band itself is BETA-EARNED.", zone = "The Deadmines" },
        { text = "Keep the band. At level 60 it pairs with Band of the Better Half: wearing both rings gives +20 Strength and a chance to become Angry (+50 Strength).", zone = "The Deadmines" },
        { text = "Set completion is FILES-ONLY: Band of the Better Half is in the beta client, but nobody has earned it (beta cap below 60 / level gates), so the completed Partners in Crime set is not confirmed as earned.", zone = "The Deadmines" },
    },
})

Add({
    id = "druid-serpent-form",
    name = "Druid Serpent Form",
    type = "form",
    expansion = "forever",
    game = "forever",
    zone = "Wailing Caverns",
    reward = "Serpent form - Cat Form becomes a serpent while the \"of the Fang\" set is equipped/active",
    solo = false,
    prereq = "Druid only; level ~20; dungeon group farming (RNG drops x5)",
    status = "BETA-EARNED",
    source = "https://wowdb.wiki/forever/guides/secrets-and-hidden-quests",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "As a Druid, run Wailing Caverns (level ~20) and collect the 5-piece \"of the Fang\" set from its bosses (RNG drops, expect repeat runs).", zone = "Wailing Caverns" },
        { text = "Equip the full set: Cat Form becomes a serpent while the set is equipped/active, per the guide.", zone = "Wailing Caverns" },
    },
})

Add({
    id = "wolfs-bane",
    name = "Wolf's Bane",
    type = "forever_item",
    expansion = "forever",
    game = "forever",
    zone = "Silverpine + three dungeons",
    reward = "Wolf's Bane (weapon that punishes wolves/worgen)",
    solo = false,
    prereq = "Race+class locked: Forsaken Paladin only; level 20; class quest runs through three dungeons",
    status = "BETA-EARNED",
    source = "https://wowdb.wiki/forever/guides/secrets-and-hidden-quests",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "As a Forsaken Paladin (level 20), pick up the Wolf's Bane class quest in Silverpine.", zone = "Silverpine Forest" },
        { text = "Follow the class quest through three dungeons to earn Wolf's Bane, a weapon that punishes wolves/worgen.", zone = "Silverpine + three dungeons" },
    },
})

Add({
    id = "coldflame-saber",
    name = "Coldflame Saber",
    type = "forever_item",
    expansion = "forever",
    game = "forever",
    zone = "Shadowfang Keep",
    reward = "Coldflame Saber (sword, +98 Fire damage vs frozen targets)",
    solo = false,
    prereq = "Class locked: Mage only; level 21; dungeon farming (Shadowfang Keep)",
    status = "BETA-EARNED",
    source = "https://wowdb.wiki/forever/guides/secrets-and-hidden-quests",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "As a Mage, farm Shadowfang Keep (level 21) for the Blade of Silverlaine drop.", zone = "Shadowfang Keep" },
        { text = "Decipher the Scroll of the Saber.", zone = "Shadowfang Keep" },
        { text = "Transform the blade into the Coldflame Saber (+98 Fire damage vs frozen targets).", zone = "Shadowfang Keep" },
    },
})

Add({
    id = "blessing-of-kalimdor",
    name = "Blessing of Kalimdor",
    type = "forever_item",
    expansion = "forever",
    game = "forever",
    zone = "The Barrens / Stonetalon Mountains",
    reward = "Blessing of Kalimdor set (3 leveling pieces; set bonus +5% movement speed in The Barrens & Stonetalon Mountains)",
    solo = true,
    prereq = "Files-only: in the beta client, but not confirmed as earned (beta cap / level gates per report)",
    status = "FILES-ONLY",
    source = "https://wowdb.wiki/forever/guides/secrets-and-hidden-quests",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Per the client files, this is a 3-piece leveling set found in The Barrens and Stonetalon Mountains.", zone = "The Barrens / Stonetalon Mountains" },
        { text = "The set bonus is +5% movement speed in The Barrens & Stonetalon Mountains.", zone = "The Barrens / Stonetalon Mountains" },
        { text = "FILES-ONLY: nobody earned this set in beta, so treat it as unconfirmed until it is earned on the live build.", zone = "The Barrens / Stonetalon Mountains" },
    },
})

Add({
    id = "keystone-fragment",
    name = "Keystone Fragment Mystery",
    type = "questline",
    expansion = "forever",
    game = "forever",
    zone = "Thoradin's Wall -> Undercity sewers -> Blackrock Mountain",
    reward = "Unknown - chain is unsolved; the Stone Key has been obtained, its use is unknown",
    solo = true,
    prereq = "Starts in the Cozy Sleeping Bag room at Thoradin's Wall; solo so far; PvP flag risk for Alliance in the Undercity sewers on a PvE ruleset (per report)",
    status = "UNSOLVED",
    source = "https://www.warcrafttavern.com/forever/news/secret-finders-are-investigating-a-keystone-fragment-in-wow-forever/",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "In the Sleeping Bag room at Thoradin's Wall, read the Burnt Page (in the metal bucket above the burnt tapestry).", zone = "Thoradin's Wall" },
        { text = "Follow the clue to the Undercity back-entrance sewer corridor: interact with the debris/book showing Blackrock Mountain, Dark Portal and Fire Plume Ridge images, and loot the Torn Page + knife to obtain the Keystone Fragment (green, unlabeled on-use). The \"Page 155\" clue is page 155 of the official WoW manual (Orc Warrior over the southern Eastern Kingdoms map).", zone = "Undercity sewers" },
        { text = "In Blackrock Mountain, in the corridors toward Blackrock Spire (parkour on the platforms right of the BWL-attunement ramp, per Warcraft Tavern), find the satchel guarded by a Scarshield Grunt who does not attack, and use the Keystone Fragment to obtain the Stone Key (unlabeled on-use).", zone = "Blackrock Mountain" },
        { text = "UNSOLVED: the next step after the Stone Key was unknown as of the Sept 30 - Oct 2026 reporting. Check the #forever-secrets channel of the Secret Finding Discord for the latest state before treating this chain as solved.", zone = "Blackrock Mountain" },
    },
})

Add({
    id = "spring-legendary",
    name = "Spring 2027 Legendary (files-only)",
    type = "questline",
    expansion = "forever",
    game = "forever",
    zone = "Nordrassil / Hyjal raids (per files)",
    reward = "A legendary - Blizzard has confirmed only that a legendary arrives in spring 2027; all further detail is files-only",
    solo = false,
    prereq = "Level 60; raid (per files); not earnable yet",
    status = "FILES-ONLY",
    source = "https://wowdb.wiki/forever/guides/secrets-and-hidden-quests",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Blizzard has confirmed only that a legendary arrives in spring 2027. Nothing about it can be earned yet.", zone = "Nordrassil / Hyjal raids (per files)" },
        { text = "Per the client files, the questline is built around a branch of Nordrassil, with the Hyjal raids (Stormwraith, Sylvestris per files) involved. These details are datamined, not earnable, and subject to change - do not treat them as confirmed.", zone = "Nordrassil / Hyjal raids (per files)" },
    },
})
