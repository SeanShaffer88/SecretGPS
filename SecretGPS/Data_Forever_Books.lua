-- SecretGPS data (Forever): Library Books locations.
--
-- Appends one step per located book to the "library-books" entry in
-- Data_Forever.lua (same mutation pattern as Data_Retail_LFH.lua).
-- All locations transcribed from the Lost WOW Forever Library Books
-- guide (lostwow.com/ForeverLibraryBooks.shtml, updated Oct 5, 2026;
-- cross-checked there against Warcraft Wiki / Wowhead / Icy Veins).
-- Beta locations - re-verify on the live Nov 4 build. Coordinates are
-- zone x/y pairs only; no mapIDs were published for these zones.

local _, ns = ...

local BOOKS = {
    -- Eastern Kingdoms
    { zone = "Elwynn Forest", x = 65.4, y = 70.1, text = "Book: Archmage Theocritus' Research Journal - halfway up the Tower of Azora" },
    { zone = "Loch Modan", x = 35.6, y = 48.9, text = "Book: Rumi of Gnomeregan: The Collected Works - upstairs in the Thelsamar inn (Horde reportedly cannot take this copy; use the Westfall copy)" },
    { zone = "Westfall", x = 52.7, y = 53.8, text = "Book: Rumi of Gnomeregan: The Collected Works (second copy) - behind the innkeeper at Sentinel Hill" },
    { zone = "Ironforge", x = 76.3, y = 10.8, text = "Book: Archmage Antonidas: The Unabridged Autobiography - on the table in the Hall of Explorers" },
    { zone = "Loch Modan", x = 77.5, y = 14.1, text = "Book: Runes of the Sorcerer-Kings - in the ogre cave at Mo'grosh Stronghold" },
    { zone = "Westfall", x = 45.4, y = 70.5, text = "Book: Bewitchments and Glamours - on a bookshelf in the first house on the left in Moonbrook" },
    { zone = "Tirisfal Glades", x = 59.5, y = 52.3, text = "Book: The Apothecary's Metaphysical Primer - in the alchemy shop in Brill" },
    { zone = "Silverpine Forest", x = 63.5, y = 63.1, text = "Book: The Dalaran Digest, Vol. 23 - in the north-east corner of the Amber Mill hall" },
    { zone = "Duskwood", x = 16.7, y = 28.5, text = "Book: Crimes Against Anatomy - in the Dawning Wood Catacombs, through the Raven Hill Crypt" },
    { zone = "Wetlands", x = 33.6, y = 47.9, text = "Book: Goaz Scrolls - in an urn on the lowest level of Whelgar's Excavation Site" },
    { zone = "Arathi Highlands", x = 73.0, y = 65.0, text = "Book: A Web of Lies: Debunking Myths and Legends - outside a tent in Witherbark Village" },
    { zone = "Alterac Mountains", x = 48.5, y = 57.6, text = "Book: Defensive Magics 101 - in the first tower of the ogre fortress at Gallows' Corner" },
    { zone = "Stranglethorn Vale", x = 41.5, y = 50.8, text = "Book: Basilisks: Should Petrification be Feared? - on a wooden platform right of the Crystalvein Mine entrance" },
    { zone = "Swamp of Sorrows", x = 61.0, y = 22.0, text = "Book: A Luddite's Guide to Caring for Your Demonic Pet - in a cage at Fallow Sanctuary (usually clickable through the bars; the Lost Ones nearby drop a cage key if not)" },
    { zone = "Swamp of Sorrows", x = 70.0, y = 51.0, text = "Book: Sanguine Sorcery - on top of the Temple of Atal'Hakkar" },
    { zone = "Badlands", x = 57.0, y = 39.0, text = "Book: Mummies: A Guide to the Unsavory Undead - in a crypt on the mountain (the path up starts around 56.0, 45.0)" },
    { zone = "Searing Gorge", x = 37.8, y = 49.6, text = "Book: A Mind of Metal - on a table under a tent" },
    { zone = "The Hinterlands", x = 36.0, y = 72.7, text = "Book: Venomous Journeys - behind a wall near the easternmost temple of Shadra'Alor" },
    { zone = "Blasted Lands", x = 55.3, y = 32.2, text = "Book: Conjurer's Codex" },
    { zone = "Eastern Plaguelands", x = 47.3, y = 42.3, text = "Book: The Knight and the Lady" },
    { zone = "Eastern Plaguelands", x = 26.5, y = 15.0, text = "Book: Scourge: Undead Menace or Misunderstood? - on a table before the Stratholme bridge (two Crypt Walkers stand right next to it)" },
    { zone = "Eastern Plaguelands", x = 71.8, y = 48.2, text = "Book: A Study of the Light - inside Light's Hope Chapel" },
    { zone = "Western Plaguelands", x = 38.3, y = 54.6, text = "Book: Undead Potatoes - upstairs in Janice Felstone's farmhouse" },
    { zone = "Western Plaguelands", x = 69.4, y = 72.8, text = "Book: Necromancy 101 - at the very top of the Scholomance building on Caer Darrow, outside the instance" },
    -- Kalimdor
    { zone = "Darkshore", x = 59.6, y = 22.2, text = "Book: Nar'thalas Almanac, Vol. 74 - down the stairs on the third landing of the Ruins of Mathystra" },
    { zone = "Orgrimmar", x = 38.7, y = 78.4, text = "Book: The Lessons of Ta'zo - on the large tablet in the Valley of Spirits" },
    { zone = "The Barrens", x = 56.3, y = 8.8, text = "Book: Arcanic Systems Manual - on a chair in the control room on top of the Sludge Fen oil rig" },
    { zone = "The Barrens", x = 52.8, y = 54.7, text = "Book: Secrets of the Dreamers - in the Cavern of Mists near the Wailing Caverns entrance, outside the instance" },
    { zone = "The Barrens", x = 62.7, y = 36.3, text = "Book: Baxtan: On Destructive Magics - next to Gazlowe in the engineering building in Ratchet" },
    { zone = "Stonetalon Mountains", x = 74.4, y = 85.7, text = "Book: Fury of the Land - on a barrel in a tent at the Grimtotem Post" },
    { zone = "Dustwallow Marsh", x = 57.0, y = 21.0, text = "Book: RwlRwlRwlRwl! - at the eastern edge of the murloc camp at Witch Hill" },
    { zone = "Desolace", x = 55.0, y = 28.0, text = "Book: Demons and You - on a bench in the large building of Thunder Axe Fortress" },
    { zone = "Thousand Needles", x = 34.0, y = 40.0, text = "Book: Geomancy: The Stone-Cold Truth - in the largest hut at Darkcloud Pinnacle (the path up starts around 31.0, 37.0)" },
    { zone = "Tanaris", x = 72.6, y = 47.8, text = "Book: Legends of the Tidesages - on a bookshelf in the middle building of the pirate camp" },
    { zone = "Azshara", x = 20.7, y = 62.0, text = "Book: Everyday Etiquette - on a crate beside the hut at the Haldarr Encampment" },
    { zone = "Winterspring", x = 60.7, y = 37.7, text = "Book: Ka-Boom! - behind the alchemy vendor in Everlook" },
    { zone = "Felwood", x = 65.2, y = 3.2, text = "Book: Northern Kalimdor: A Comprehensive Guide - by the bridge above the reputation vendor inside Timbermaw Hold" },
}

for i = 1, #ns.Entries do
    local e = ns.Entries[i]
    if e.id == "library-books" then
        for j = 1, #BOOKS do
            local b = BOOKS[j]
            table.insert(e.steps, { text = b.text, zone = b.zone, x = b.x, y = b.y })
        end
        table.insert(e.steps, { text = "Books without coordinates in the guide: Stonewrought Design and Magma or Lava? - two books on platforms in Blackrock Mountain, outside the instances", zone = "Blackrock Mountain" })
    end
end
