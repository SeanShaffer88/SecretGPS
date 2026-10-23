-- SecretGPS -- Retail data (Mind-Seeker completion batch, v0.6.0)
-- The five Seat of Knowledge records that were missing from the
-- catalog, transcribed 2026-10-23 from the Warcraft Secrets guides
-- (Mind-Seeker, Secrets of Azeroth, Memory of Scholomance, Wan'be's
-- Buried Goods, Incognitro). Coordinates and quest IDs appear only
-- where those guides published them.
local _, ns = ...
ns.Entries = ns.Entries or {}
local function Add(e) ns.Entries[#ns.Entries + 1] = e end

Add({
  id = "tobias", name = "Tobias", type = "pet",
  expansion = "dragonflight", game = "retail", zone = "Azeroth-wide",
  reward = "Tobias pet (Community Rumor Mill achievement)", mindSeeker = true,
  solo = "Solo (one satchel needs 2 extra Torch bearers)", difficulty = 3, estTime = "~1-2h",
  timeGate = nil, rng = nil, prereq = "Secrets of Azeroth chain rewards help: Tricked-Out Thinking Cap and Torch of Pyrreth (several satchels need them)",
  source = "https://warcraft-secrets.com/guides/secrets-of-azeroth-world-event",
  verifiedPatch = "12.1.5",
  completion = { questFlags = {77288, 77291, 77289, 77292, 77290, 77293, 77296, 77294, 77297, 77298, 77299, 77300, 77302, 78208, 77301, 78207, 77295} },
  steps = {
    { text = "Tobias is the reward for the Community Rumor Mill achievement: loot all 17 Buried Satchels that Blizzard hid behind community rumor clues during Secrets of Azeroth. Each sits in a Loose Dirt Mound; the steps below give every mound's spot", zone = "Azeroth-wide" },
    { text = "Satchel 1 (Felwood): dive to the bottom of the Bloodvenom Falls lake", zone = "Felwood", mapID = 77, x = 42.2, y = 48.1 },
    { text = "Satchel 2 (Thousand Needles): enter the underwave cave of Splithoof Hold (entrance 43.9, 37.5) and swim north to the end of the cave", zone = "Thousand Needles", mapID = 64, x = 42.7, y = 30.6 },
    { text = "Satchel 3 (Eastern Plaguelands): from the Plague Plaque by the Corin's Crossing bridge (51.5, 65.0), follow the Tricked-Out Thinking Cap offset (15, 15)", zone = "Eastern Plaguelands", mapID = 23, x = 55.3, y = 59.5 },
    { text = "Satchel 4 (Shadowmoon Valley, Draenor): Moonwillow Peak - next to the Oracle Stone below the tree", zone = "Shadowmoon Valley (Draenor)", mapID = 539, x = 35.3, y = 49.0 },
    { text = "Satchel 5 (Netherstorm): outside Manaforge B'naar - bring two other players with the Torch of Pyrreth and channel on the 3 crystals together to spawn the Loose Dirt Mound", zone = "Netherstorm", mapID = 109, x = 26.2, y = 68.5 },
    { text = "Satchel 6 (Valley of the Four Winds): inside the mouth of the mogu statue at the Heartland", zone = "Valley of the Four Winds", mapID = 376, x = 56.8, y = 21.4 },
    { text = "Satchel 7 (The Azure Span): melt one of the snowmen with the Torch of Pyrreth to reveal the mound", zone = "The Azure Span", mapID = 2024, x = 25.2, y = 71.4 },
    { text = "Satchel 8 (Dragonblight): Emerald Dragonshrine, at the claw of the fallen dragon", zone = "Dragonblight", mapID = 115, x = 63.9, y = 72.6 },
    { text = "Satchel 9 (Northern Barrens)", zone = "Northern Barrens", mapID = 10, x = 46.0, y = 50.6 },
    { text = "Satchel 10 (Blasted Lands): at the mysterious ritual, use the Torch of Pyrreth near the crystal to reveal the mound", zone = "Blasted Lands", mapID = 17, x = 64.7, y = 55.4 },
    { text = "Satchel 11 (Nagrand, Outland): floating island above Skysong Lake, behind the skeleton", zone = "Nagrand (Outland)", mapID = 107, x = 57.8, y = 26.3 },
    { text = "Satchel 12, Alliance (Grizzly Hills): speak with Gordun to start the log ride to Venture Bay - with the WHEE! buff you can loot the mound", zone = "Grizzly Hills", mapID = 116, x = 20.2, y = 81.3 },
    { text = "Satchel 12, Horde (Grizzly Hills): speak with Darrok to start the log ride to Venture Bay - with the WHEE! buff you can loot the mound", zone = "Grizzly Hills", mapID = 116, x = 11.0, y = 74.9 },
    { text = "Satchel 13 (Dragonblight): Bronze Dragonshrine - from satchel 8's mound, follow the Tricked-Out Thinking Cap offset (52, 123)", zone = "Dragonblight", mapID = 115, x = 73.2, y = 39.5 },
    { text = "Satchel 14 (Highmountain): Highmountain Peak", zone = "Highmountain", mapID = 650, x = 53.3, y = 87.5 },
    { text = "Satchel 15 (Timeless Isle): the middle of the Celestial Court", zone = "Timeless Isle", mapID = 554, x = 38.7, y = 55.0 },
    { text = "Satchel 16 (Western Plaguelands): from satchel 3's mound, follow the Tricked-Out Thinking Cap offset (-198, -84)", zone = "Western Plaguelands", mapID = 22, x = 68.8, y = 73.2 },
    { text = "Satchel 17 (Tiragarde Sound): the peak of the mountain above Freehold", zone = "Tiragarde Sound", mapID = 895, x = 74.5, y = 86.1 },
    { text = "Looting the last satchel completes the Community Rumor Mill achievement and awards Tobias (the Community Rumors achievement and its Blue Tweed Cap complete along the way)", zone = "Azeroth-wide" },
  },
})

Add({
  id = "mimirons-jumpjets", name = "Mimiron's Jumpjets", type = "mount",
  expansion = "dragonflight", game = "retail", zone = "Azeroth-wide",
  reward = "Mimiron's Jumpjets mount", mindSeeker = true,
  solo = "Small group (parts 1 and 3 need other players)", difficulty = 3, estTime = "~1h",
  timeGate = nil, rng = nil, prereq = "Torch of Pyrreth toy (Secrets of Azeroth secret 5) for the first booster part",
  source = "https://warcraft-secrets.com/guides/secrets-of-azeroth-world-event",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Forge the Jumpjets from 3 booster parts hidden by Blizzard's community puzzles, then combine them at an Empowered Arcane Forge", zone = "Azeroth-wide" },
    { text = "First Booster Part - Jaguero Isle, Cape of Stranglethorn: bring 2 other players, light the three braziers with the Torch of Pyrreth, defeat the Enigma Ward and loot the part", zone = "Cape of Stranglethorn", mapID = 210, x = 59.4, y = 79.0 },
    { text = "Second Booster Part - Irontree Woods, Felwood: loot the part", zone = "Felwood", mapID = 77, x = 49.9, y = 26.4 },
    { text = "Third Booster Part - the Dark Portal, Blasted Lands: bring at least one other player. Destroy the two Legion Flak Cannons nearby, then channel the Mimiron's Booster Part for 12 seconds while your partner keeps attackers off you", zone = "Blasted Lands", mapID = 17, x = 54.8, y = 52.1 },
    { text = "Bring the 3 booster parts to the Empowered Arcane Forge in Valdrakken and combine them (Jumpjet Fusion) to create Mimiron's Jumpjets", zone = "Valdrakken", mapID = 2112, x = 36.5, y = 61.9 },
  },
})

Add({
  id = "fashion-of-the-fanatic-felcyclist", name = "Fashion of the Fanatic Felcyclist", type = "transmog",
  expansion = "midnight", game = "retail", zone = "Suramar > Azsuna",
  reward = "Ensemble: Fashion of the Fanatic Felcyclist (transmog)", mindSeeker = true,
  solo = "Group (escort)", difficulty = 4, estTime = "~30-60 min",
  timeGate = nil, rng = nil, prereq = "Incognitro mount and Torch of Pyrreth. This is Puzzle 12 (Dusk Lily) of Incognitro's Midnight continuation - Puzzles 10 and 11 are NOT required",
  source = "https://warcraft-secrets.com/guides/incognitro-the-indecipherable-felcycle",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Form a group and search Suramar's island with the Torch of Pyrreth for the hidden Web of Shadows - it patrols around the island and moves quickly; the torch reacts as you get closer", zone = "Suramar", mapID = 680, x = 83.6, y = 69.6 },
    { text = "The moment the extra action button appears (it may show for only a split second when you are on top of the web), use it to reveal the Web of Shadows, then interact with it to free the Dusk Lily - one player becomes the carrier", zone = "Suramar" },
    { text = "Escort the carrier to Azsuna: they must not jump, attack, be hit by creatures, or touch water (Death Knight Path of Frost and Priest Levitate help over water). The group kills the Writhing Corruptions that constantly spawn to attack the carrier; Starry-Eyed Goggles counter the Darkness effect", zone = "Suramar > Azsuna" },
    { text = "The carrier speaks with Golk the Rumble and offers the Dusk Lily. Everyone in the group receives a Spare Key and a Weathered Lockbox containing the Ensemble: Fashion of the Fanatic Felcyclist", zone = "Azsuna", mapID = 630, x = 57.6, y = 42.8 },
    { text = "Bonus: with the Gift of Oddsight and Starry-Eyed Goggles buffs active, a Hidden Footlocker becomes visible near the final pillar in Ratts' Lair - open it with the Spare Key for Ratts' Journal, Page 317", zone = "Karazhan Catacombs" },
  },
})

Add({
  id = "leaders-of-scholomance", name = "Leaders of Scholomance", type = "achievement",
  expansion = "dragonflight", game = "retail", zone = "Western Plaguelands / Scholomance",
  reward = "Leaders of Scholomance achievement + access to the original Scholomance (Memory of Scholomance)", mindSeeker = true,
  solo = "Solo (a friend with Krastinov's Bag of Horrors can substitute for owning it)", difficulty = 3, estTime = "~1-2h",
  timeGate = nil, rng = "Krastinov's Bag of Horrors drops from a rare spawn (Doctor Theolen Krastinov, Heroic Scholomance)", prereq = "5x Essence of Undeath and 3x Dark Rune (Auction House); Krastinov's Bag of Horrors toy or a party member who has it",
  source = "https://warcraft-secrets.com/guides/memory-of-scholomance",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Buy 5x Essence of Undeath and 3x Dark Rune from the Auction House before you start", zone = "Auction House" },
    { text = "Get Krastinov's Bag of Horrors: it drops from Doctor Theolen Krastinov, a rare spawn in Heroic Scholomance who may appear after Rattlegore dies, yelling 'The doctor is in!'. A party member who owns the toy can cover this requirement", zone = "Scholomance (Heroic)" },
    { text = "Fully clear Scholomance and go to the Hall of the Damned (upper floor behind Darkmaster Gandling). Use the Bag of Horrors and look for the pile of bones with a bright femur at the end of the room - approach it and Eva Sarkhoff's ghost appears", zone = "Scholomance" },
    { text = "Remove the Surgical Alterations buff, speak with Eva to receive the Inert Spectral Essence, then loot Eva's Femur from the bone pile", zone = "Scholomance" },
    { text = "Combine the Inert Spectral Essence with the 5 Essence of Undeath and 3 Dark Rune to create the Spectral Essence trinket (if you finished Kirtonos the Herald before Cataclysm, Eva hands you the trinket directly; a replacement comes from Eva outside Scholomance)", zone = "Scholomance" },
    { text = "Loot Eva's Journal from behind a bookshelf in the Viewing Room (the room with Professor Slate)", zone = "Scholomance" },
    { text = "Equip the Spectral Essence trinket - it lets you see and trade with the ghosts of Caer Darrow. Gather 5 candles for them, starting with the Stinky Candle: loot the Caer Darrow Fountain Water", zone = "Western Plaguelands", mapID = 22, x = 68.9, y = 78.9 },
    { text = "Trade the fountain water to Joseph Dirte for the Stinky Candle", zone = "Western Plaguelands", mapID = 22, x = 68.0, y = 74.8 },
    { text = "Tobacco-Filled Candle: enter Stratholme (main entrance) and loot the Undelivered Shipment of Smokes from a cart in King's Square, then trade it to Rory", zone = "Western Plaguelands", mapID = 22, x = 63.4, y = 75.3 },
    { text = "Ghost-Warding Candle: loot the Trampled Doll near the Meat Wagon", zone = "Eastern Plaguelands", mapID = 23, x = 35.7, y = 83.7 },
    { text = "Trade the doll to Sammy for the Ghost-Warding Candle", zone = "Western Plaguelands", mapID = 22, x = 69.2, y = 78.7 },
    { text = "Authentic Andorhal Candle: loot The Deed to Andorhal from a wall inside Andorhal's town hall", zone = "Western Plaguelands", mapID = 22, x = 43.6, y = 69.3 },
    { text = "Trade the deed to Magistrate Marduke for the Authentic Andorhal Candle", zone = "Western Plaguelands", mapID = 22, x = 70.5, y = 74.0 },
    { text = "Imported Candle: loot The Road Ahead from a wall inside the inn at Corin's Crossing", zone = "Eastern Plaguelands", mapID = 23, x = 55.0, y = 64.0 },
    { text = "Trade it to Artist Renfray for the Imported Candle", zone = "Western Plaguelands", mapID = 22, x = 65.7, y = 75.3 },
    { text = "With all 5 candles, enter the Scholomance building, turn right into the small room full of bones, and use Eva's Journal to perform the ritual - this completes the Memory of Scholomance achievement, and Eva's Enchanted Journal there now opens the original Scholomance", zone = "Western Plaguelands", mapID = 22, x = 69.8, y = 71.8 },
    { text = "Leaders of Scholomance, part 1: enter the original Scholomance and jump off the platform to the left WITHOUT killing the two Risen Guards. Open the Iron Gate, turn left, and defeat Rattlegore downstairs in the Great Ossuary - loot the Viewing Room Key", zone = "Scholomance (original)" },
    { text = "Go upstairs and turn right back to the starting room. Unlock the Viewing Room Door with the key, open the Iron Gate to the left, and head down to the Headmaster's Study", zone = "Scholomance (original)" },
    { text = "Clear all 6 rooms (3 on each level) including all trash, and loot the Blood of Innocents from Doctor Theolen Krastinov in the Hall of the Damned. Darkmaster Gandling then spawns in the center yelling 'School is in session!' - defeat him for the first half of the achievement", zone = "Scholomance (original)" },
    { text = "Go upstairs and head north to the Chamber of Summoning. Place the Blood of Innocents on the Brazier of the Herald to summon Kirtonos the Herald, and defeat him to complete Leaders of Scholomance", zone = "Scholomance (original)" },
  },
})

Add({
  id = "wanbes-buried-goods", name = "Wan'be's Buried Goods", type = "questline",
  expansion = "battleforazeroth", game = "retail", zone = "Vol'dun > Azeroth-wide > Zuldazar",
  reward = "Wan'be's Buried Goods (120 gold) - the hunt itself is the Mind-Seeker record", mindSeeker = true,
  solo = "Solo (Horde only)", difficulty = 2, estTime = "~45 min",
  timeGate = nil, rng = nil, prereq = "Horde character - this treasure hunt is Horde-only",
  source = "https://warcraft-secrets.com/guides/treasure-hunt-wanbes-buried-goods",
  verifiedPatch = "12.1.5",
  steps = {
    { text = "Buy the Ghostly Explorer's Skull from Hoarder Jena, the Voldunai emissary vendor in Vol'dun", zone = "Vol'dun" },
    { text = "Place the skull on the ground anywhere to summon the spirit of Wan'be the Explorer and speak with him. He muses about places he wants to see - each remark is a clue. Take the skull to each place, summon him there, and talk until he gives the next clue", zone = "Azeroth-wide" },
    { text = "Clue 1 - 'a saber in the snow': Frostsaber Rock, at the northernmost part of Winterspring, where the snow sabercats live. Summon Wan'be and speak with him", zone = "Winterspring" },
    { text = "Clue 2 - 'biggest reptiles of all time': the Caverns of Time. Place the skull on the FLOOR in front of Zaladormu (not on the platform he lies on) and speak with Wan'be", zone = "Caverns of Time" },
    { text = "Clue 3 - the flooded desert racing track: the Raceway Ruins in Thousand Needles, under Fizzle and Pozzik's Speedbarge. Summon Wan'be underwater and speak with him", zone = "Thousand Needles", mapID = 64, x = 78.8, y = 77.0 },
    { text = "Clue 4 - 'lived in a volcano': place the skull INSIDE Blackrock Mountain and speak with Wan'be", zone = "Blackrock Mountain" },
    { text = "Finale: after the fourth stop Wan'be tells you about his buried goods - a tower just off the Rootway near the river. The hint says Nazmir, but the goods are on the Zuldazar side of the river: loot Wan'be's Buried Goods at the foot of the tower for 120 gold", zone = "Zuldazar", mapID = 862, x = 63.6, y = 9.8 },
  },
})
