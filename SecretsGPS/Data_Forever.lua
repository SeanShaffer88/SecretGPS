-- SecretsGPS: WoW: Forever exclusive secrets (report section 3.8).
-- Facts and coordinates transcribed only from the research report.
-- Forever entries mostly have no mapIDs and few coordinates in the
-- report; x/y are omitted wherever the report does not give them.
-- All Forever entries must be re-verified on the live Nov 4 build.
local _, ns = ...
ns.Entries = ns.Entries or {}
local function Add(e) ns.Entries[#ns.Entries + 1] = e end

Add({
    id = "cozy-sleeping-bag",
    name = "Cozy Sleeping Bag",
    type = "forever_item",
    expansion = "forever",
    game = "forever",
    zone = "Westfall / The Barrens -> Stonetalon Mountains -> Loch Modan -> Thoradin's Wall",
    reward = "Cozy Sleeping Bag (sleep for up to +3% XP) + 12-slot bag",
    solo = true,
    prereq = "Level 14; faction-specific start order (reverse order by faction); jumping puzzles",
    status = "BETA-EARNED",
    source = "https://wowdb.wiki/forever/guides/secrets-and-hidden-quests",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Interact the burnt remains for the quest \"...and that note you found\": Alliance starts at Alexston Farmstead, Westfall; Horde starts at the destroyed tower south of Camp Taurajo, The Barrens.", zone = "Westfall / The Barrens" },
        { text = "Visit the other faction's remains for \"Stepping Stones\" (the start order is reversed by faction).", zone = "The Barrens / Westfall" },
        { text = "Stonetalon Mountains: take the path northeast of Sun Rock Retreat to the abandoned camp for \"Scramble\", then follow the jump path to the dirt mound for \"Wet Job\" (campfire rewards: Simple Wood, Flint and Tinder).", zone = "Stonetalon Mountains" },
        { text = "Loch Modan: at Stonewrought Dam, jump down the easternmost dwarf head (a miss means a fall to the Wetlands) for \"Eagle's Fist\".", zone = "Loch Modan" },
        { text = "Thoradin's Wall (Hillsbrad side): complete the broken-cart jumping puzzle to the hidden room and turn in by the hanging bag for \"This Must Be The Place\".", zone = "Thoradin's Wall" },
        { text = "Turn in at the scroll below the bag to receive the Cozy Sleeping Bag and the 12-slot bag.", zone = "Thoradin's Wall" },
        { text = "UNSOLVED mystery: in this same Thoradin's Wall room, the Burnt Page (in the metal bucket above the burnt tapestry) starts the Keystone Fragment mystery. Its next steps were unknown as of the report; do not treat this chain as solved.", zone = "Thoradin's Wall" },
    },
})

Add({
    id = "library-books",
    name = "Library Books",
    type = "forever_item",
    expansion = "forever",
    game = "forever",
    zone = "Azeroth-wide",
    reward = "Librarian tiers: 10 books = necklace (Scholarly Pendant / Erudite's Amulet); 20 = ring (Field Researcher's Loop / Philanthropist's Ring); 25 = Truthseeker's Bow, Crest of Elucidation (shield) or Researcher's Night Light (off-hand). Mages also unlock Research",
    solo = true,
    prereq = "Any level; Mage bonus (Research unlock)",
    status = "BETA-EARNED",
    source = "https://lostwow.com/ForeverLibraryBooks.shtml",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Collect Library Books hidden across Azeroth and hand each in to your faction librarian: Garion Wendell in Stormwind (37.6, 80.8) or Owen Thadd in Undercity (73.4, 33.0). The located books follow as steps below (Lost WOW guide, cross-checked there against Warcraft Wiki, Wowhead and Icy Veins).", zone = "Stormwind City / Undercity", x = 37.6, y = 80.8 },
        { text = "Reach 10 books: Friend of the Library - choose the Scholarly Pendant or Erudite's Amulet necklace.", zone = "Azeroth-wide" },
        { text = "Reach 20 books (level 20): Greater Friend of the Library - choose the Field Researcher's Loop or Philanthropist's Ring.", zone = "Azeroth-wide" },
        { text = "Reach 25 books (level 30 quest, added in the Oct 2 beta build): choose the Truthseeker's Bow (no level requirement; players call it the best bow at its level), the Crest of Elucidation shield or the Researcher's Night Light off-hand (both need level 40). Lost WOW notes a reward this strong may be tuned before launch.", zone = "Azeroth-wide" },
        { text = "Mages additionally unlock Research: inside a library, Study (1 Light Feather, 1-hour cooldown) creates a Bundle of Scrolls with mage scrolls such as Imbue Lesser Flame or Imbue Chillknife.", zone = "Azeroth-wide" },
        { text = "Book counts differ by source: wowdb.wiki said 40 books; Lost WOW's guide lists the spots below. Two Season of Discovery books (Silverpine, Feralas) moved in Forever and their new spots are not confirmed yet.", zone = "Azeroth-wide" },
    },
})

Add({
    id = "musical-gustjumper",
    name = "Musical Gustjumper",
    type = "pet",
    expansion = "forever",
    game = "forever",
    zone = "Zephras Isle",
    reward = "Musical Gustjumper (frog companion pet)",
    prereq = "Skyborne start zone access (paid race pack); whether non-Skyborne can reach the Zephras Isle frogs is not confirmed - flag for live verification",
    status = "BETA-EARNED",
    source = "https://wowdb.wiki/forever/guides/secrets-and-hidden-quests",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Sing (/sing) to five frogs to earn the Musical Gustjumper companion pet.", zone = "Zephras Isle", x = 51.5, y = 72.1 },
    },
})

Add({
    id = "tome-of-dalaran",
    name = "Tome of Dalaran: Lyn the Ignored",
    type = "questline",
    expansion = "forever",
    game = "forever",
    zone = "Shadowfang Keep -> Silverpine Forest -> City of Dalaran (dungeon)",
    reward = "Secret boss Lyn the Ignored (loot unreported in source)",
    solo = false,
    prereq = "Level ~30 content; dungeon groups (late beta addition)",
    status = "BETA-SOLVED",
    source = "https://www.warcrafttavern.com/forever/news/tome-of-dalaran-mystery-solved-in-wow-forever/",
    verifiedPatch = "Forever beta (re-verify on live Nov 4 build)",
    steps = {
        { text = "Clear Shadowfang Keep; after Arugal, climb the stairs behind his room and take the Black Tome from the alchemy table.", zone = "Shadowfang Keep" },
        { text = "Use the Black Tome at the Ambermill Leyline Focus (the blue crystal by Archmage Ataeric, town hall, Ambermill) to obtain the Tome of Dalaran.", zone = "Silverpine Forest", x = 63.4, y = 64.3 },
        { text = "In the City of Dalaran dungeon, go through the Underbelly, past Atrexis the Grave Knight, and go straight instead of taking the right ramp; clear the small room.", zone = "City of Dalaran (dungeon)" },
        { text = "Use the Tome of Dalaran at the summoning circle to summon the secret boss Lyn the Ignored.", zone = "City of Dalaran (dungeon)" },
        { text = "Defeat Lyn the Ignored. The boss's loot was unreported in the source.", zone = "City of Dalaran (dungeon)" },
    },
})
