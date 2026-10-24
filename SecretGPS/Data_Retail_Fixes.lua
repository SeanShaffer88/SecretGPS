-- Data_Retail_Fixes.lua
-- Late-loading corrections for existing Retail entries; loads last and
-- rewrites steps/fields for the entries below.
-- Sources: Warcraft Secrets hubs, Icy Veins forum guide, Blizzard Watch,
-- Warcraft Mounts, Method, Wowhead/Wowpedia via search.

local _, ns = ...

-- Fix(id, fn) applies fn to the entry with that id. An id that
-- matches nothing (a typo, or an entry renamed later) would make the
-- fix a silent no-op, so misses are recorded in ns.FixMisses and the
-- gate fails on them.
ns.FixMisses = ns.FixMisses or {}
local function Fix(id, fn)
    for i = 1, #ns.Entries do
        if ns.Entries[i].id == id then
            fn(ns.Entries[i])
            return
        end
    end
    ns.FixMisses[#ns.FixMisses + 1] = id
end

Fix("nazjatar-blood-serpent", function(e)
    e.zone = "Stormsong Valley (fragments farm BfA-wide)"
    e.rng = "Abyssal Fragments are low-drop RNG - also tradeable on the Auction House"
    e.prereq = "Battle for Azeroth zone access; a group helps for the summon (for Alliance the mine is Horde-held)"
    e.steps = {
        { text = "Collect 20 Abyssal Fragments: low drops from naga, human cultists and void creatures across Battle for Azeroth zones (also Shrine of the Storm and battleground reward chests); they are tradeable, so the Auction House works", zone = "Battle for Azeroth zones" },
        { text = "Enter the Sepulcher of the Abyss cave behind the waterfall in Stormsong Valley", zone = "Stormsong Valley", x = 73.7, y = 23.3 },
        { text = "At the Altar of the Abyss inside, combine the 20 fragments into the Abhorrent Essence of the Abyss (combining costs some of your health)", zone = "Stormsong Valley" },
        { text = "Go to the Saltstone Mine in Warfang Hold and use the Essence at the Abyssal Icon to summon the Adherent of the Abyss", zone = "Stormsong Valley", x = 59.0, y = 54.0 },
        { text = "Kill the Adherent of the Abyss - it drops the Nazjatar Blood Serpent at 100%. Its tentacles and psychic whips make it rough solo; Alliance players should bring a group, since the mine's Horde NPCs keep respawning", zone = "Stormsong Valley" },
    }
end)

Fix("bound-shadehound", function(e)
    e.prereq = "Ve'nari at Appreciative reputation in the Maw, plus Stygia for her items (1050 + 1500 + 2000)"
    e.timeGate = "Stygia grind: 200 Stygia Dust + 200 Stygia Sliver collected with the Dowser"
    e.source = "https://www.icy-veins.com/forums/topic/57218-how-to-get-the-bound-shadehound-mount-in-patch-905/"
    e.steps = {
        { text = "Reach Appreciative reputation with Ve'nari and buy from her the Animated Levitating Chain (1050 Stygia) and the Stygia Dowser (1500 Stygia)", zone = "The Maw" },
        { text = "Use the Stygia Dowser near Stygia Nexus points to collect 200 Stygia Dust and 200 Stygia Sliver", zone = "The Maw" },
        { text = "At the Stygia Delirium platform, solve the rune puzzle to obtain the Crumbling Stele - READ the Stele and note its rune order, you need it at the end", zone = "The Maw", mapID = 1543, x = 24.0, y = 75.5 },
        { text = "Buy the Partial Rune Codex from Ve'nari (2000 Stygia) and find the three Rune Codex Pages: Forging (the Death's Howl cave in the Beastwarrens), Souls (Perdition Hold, near the Thanassos spawn) and Binding (a Death's Howl cave in the Beastwarrens)", zone = "The Maw" },
        { text = "Page: Forging - inside the Death's Howl cave in the Beastwarrens", zone = "The Maw", mapID = 1543, x = 48.8, y = 84.7 },
        { text = "Merge the three pages into the Partial Codex to make the Intact Rune Codex, and read it", zone = "The Maw" },
        { text = "Kill Soulforger Rhovus in Zovaal's Cauldron and loot the Soulforger's Tools - he only drops them once your Codex is complete", zone = "The Maw", mapID = 1543, x = 35.8, y = 41.8 },
        { text = "Grapple up Perdition Hold (first grapple point here) to the Altar of Domination: craft 20 Stygia Bars, then craft the Armored Husk at the forge using the Tools and your Dust and Slivers", zone = "The Maw", mapID = 1543, x = 23.0, y = 68.0 },
        { text = "The Altar of Domination itself, at the top of Perdition Hold", zone = "The Maw", mapID = 1543, x = 20.0, y = 67.0 },
        { text = "Find the Willing Wolf Soul: a Stray Soul walks the length of Gorgoa, the River of Souls - wait near this point and click it as it passes", zone = "The Maw", mapID = 1543, x = 25.0, y = 42.0 },
        { text = "At the Binding Altar south of Ve'nari's Refuge, combine the Armored Husk with the Willing Wolf Soul to create the Feral Shadehound", zone = "The Maw", mapID = 1543, x = 45.1, y = 48.3 },
        { text = "Summon the Feral Shadehound, mount it, and click the runes in the Crumbling Stele's order to perform the binding - completing the quest gives you the Bound Shadehound", zone = "The Maw" },
    }
end)

Fix("child-of-torcali", function(e)
    e.prereq = "Horde; Zuldazar access"
    e.steps = {
        { text = "Start at the Garden of the Loa in Zuldazar: Dazzerian's quest An Unending Sleep leads you to Torcali's sick baby direhorn", zone = "Zuldazar (Garden of the Loa)" },
        { text = "Follow the chain (A Loa Without a Temple, then A Show of Faith): deliver Torcali's Blessed Offering to the hatchling in Warbeast Kraal - the priestess Li'zal stays on to oversee its raising", zone = "Zuldazar (Warbeast Kraal)" },
        { text = "Raise the hatchling with daily quests over many days: feeding, walks and play fill its progress bar (the Sleep, Eat, Repeat stage) - a missed day just waits for the next reset", zone = "Zuldazar" },
        { text = "Finish the How to Train Your Direhorn chain: the final quest, Wander Not Alone, rewards the grown Child of Torcali mount", zone = "Zuldazar" },
    }
end)

Fix("xy-trustees-gearglider", function(e)
    e.zone = "K'aresh / Manaforge Omega (raid)"
    e.prereq = "Renown 8 with the Manaforge Vandals (Manaforge Omega raid renown); the three Cartel Deal items (Inscription-crafted, Auction House tradeable)"
    e.timeGate = "One Cartel Deal per week normally - up to 3 weekly resets (some players report using all three deals the same day)"
    e.estTime = "Up to 3 weeks (or one raid session)"
    e.source = "https://www.method.gg/guides/mounts/xy-trustees-gearglider-mount-guide"
    e.steps = {
        { text = "Reach Renown 8 with the Manaforge Vandals to unlock the Inscription techniques for the Cartel contracts - or simply buy the three Deal items on the Auction House", zone = "K'aresh" },
        { text = "Use Deal: Cartel Ba, then inside Manaforge Omega (any difficulty, including LFR) loot the Ba dead drop: after the Plexus Sentinel, on the right ledge by the phase-warp teleporter", zone = "Manaforge Omega" },
        { text = "Use Deal: Cartel Om, then loot the Om dead drop: behind Fractillus, on a rock inside the building at the back", zone = "Manaforge Omega" },
        { text = "Use Deal: Cartel Zo, then loot the Zo dead drop: before Forgeweaver Araz, on the first mana-vent pipe to the right in Mana-Vent Aphis - jump from the end of the walkway onto the pipe", zone = "Manaforge Omega" },
        { text = "Return to Zo'turu at Shadow Point, just outside the raid, and complete Someone Like Me to earn the Xy Trustee's Gearglider", zone = "K'aresh (Shadow Point)" },
    }
end)
