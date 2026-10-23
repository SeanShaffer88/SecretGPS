# Changelog

## 0.6.1 — 2026-10-23

The interface release — the result of a full review pass:

- **Classic quest log styling**: the catalog and the SecretTracker
  now wear the classic quest log look — parchment pages built from
  the original book art, ink-brown text, on both clients.
- **Minimap button**: a quest-log book button on the minimap
  (left-click: catalog; right-click: tracker; drag it around the
  ring — its position is saved).
- **Catalog fixes and polish**: the detail pane no longer overflows
  its window; tooltips on every control; mouse-wheel scrolling in
  both lists; the selected secret is highlighted; the Type filter
  is now a dropdown menu with counts (was click-to-cycle); search
  also matches step text and step zones.
- **SecretTracker**: a progress bar, a completion sound, and it now
  advances its saved step even while hidden (the waypoint is set
  when you open it again).
- **Collected detection (engine)**: an entry whose reward is
  already in your mount/pet/toy journal counts as solved. The
  per-entry journal IDs are being sourced and arrive in a data
  update; no entry uses it yet.
- Under the hood: catalog refreshes are coalesced on quest-log
  updates, saved data is schema-versioned with a migration path,
  and two data bugs were fixed (the Housing type label, and
  Wan'be's Buried Goods showing a raw expansion key).

## 0.6.0 — 2026-10-23

- **Mind-Seeker catalog complete: all 33 secret records.** The five
  records missing from the Seat of Knowledge board now have their
  own entries, transcribed from the Warcraft Secrets guides:
  **Tobias** (all 17 Buried Satchels as waypoint steps, with the
  satchel quest flags as the completion check), **Mimiron's
  Jumpjets** (the 3 booster parts and the Empowered Arcane Forge),
  **Fashion of the Fanatic Felcyclist** (the Dusk Lily escort from
  Incognitro's Midnight continuation), **Leaders of Scholomance**
  (the full Memory of Scholomance candle chain plus the original-
  Scholomance boss kills) and **Wan'be's Buried Goods** (the Horde
  treasure hunt, all four clue stops and the Zuldazar finale).
- **Five summary entries are now full guides**: Courage (all nine
  Larion Cub waypoints and the 5-in-10-seconds group mechanic),
  Glimr (the complete nine-quest Glimmerfin chain), Enlightened
  Hearthstone (the six pillar coordinates and the Ponderer's
  Portal), Gortham (the five-conduit dungeon mechanic) and
  J'imothy (his three Silvermoon prison spots and the channel
  release).
- Secrets of Azeroth no longer double-counts as a Mind-Seeker
  record (Tobias and the Jumpjets carry their own flags now), and
  its Tyrhold relay steps are correctly attributed to the final
  The Race secret with the guide's console numbering.
- Catalog is now **114 entries (92 Retail + 22 Forever)**. No code
  changes beyond the version number; data only.

## 0.5.0 — 2026-10-23

- **Renamed: SecretsGPS is now SecretGPS** (SEAN's direction) —
  addon folder, both TOCs, chat prefix, zip names, the GitHub
  repository (now SeanShaffer88/SecretGPS), and the SavedVariables
  store (`SecretGPSDB`); progress tracked under the SecretsGPS
  name resets once on upgrade. Slash commands are now `/sgps`
  and `/secretgps`; `/sa` still works.
- No catalog or feature changes: still 109 entries (87 Retail +
  22 Forever), the SecretTracker window, and TomTom/native
  waypoints from v0.4.0.

## 0.4.0 — 2026-10-23 (pre-release build for in-game testing)

- **Renamed: SecretAtlas is now SecretsGPS** (SEAN's direction) —
  addon folder, both TOCs, chat prefix, zip names and the
  SavedVariables store (`SecretsGPSDB`); progress from the
  0.1–0.3 test builds resets once on upgrade. Slash commands are
  now `/sgps` and `/secretsgps`; `/sa` still works.
- **SecretTracker window**: track any secret from its catalog page
  (or any single step with the new **Trk** button — tracking a step
  is tracking the NPC, item or place that step is about) and a
  small window guides you step by step: current step and zone,
  step count and % complete, automatic waypoint on every advance,
  Done/Prev/Stop controls, a completion state, and persistence
  across sessions. The catalog marks the tracked secret with `>>`.
- **Quest-flag steps advance the tracker automatically** when the
  game records them complete (QUEST_LOG_UPDATE).
- **TomTom integration**: waypoints now route through TomTom's
  AddWaypoint API when TomTom is installed, with Blizzard's
  native waypoint as the other provider — `/sgps wp auto|native|
  tomtom` chooses (auto = TomTom when present, else native).
  SecretsGPS still bundles no TomTom code.
- Gate: the backdrop rule now covers both UI files (UI.lua,
  Tracker.lua); harness gained TomTom-path, tracker start/stop,
  next-advance, flag-skip and slash-command assertions — PASS on
  both clients. Catalog still 109 entries (87 Retail + 22
  Forever).

## Unreleased

- Repository documentation set completed per SEAN's addon doc
  standard: `FEATURES.md` (full feature list) and `DESCRIPTION.md`
  (store-listing description) added alongside `README.md` and this
  changelog.

## 0.3.0 — 2026-10-23 (pre-release build for in-game testing)

- Catalog grew to **109 entries (87 Retail + 22 Forever)**.
- **Forever: Library Books completed** — the located book spots
  (37 with coordinates, from the Lost WOW guide) are now individual
  waypoint steps, and the reward tiers are corrected: 25 books earn
  the Truthseeker's Bow / Crest of Elucidation / Researcher's Night
  Light tier (the v0.2 "files-only" note was wrong).
- **Forever: 10 new entries from Lost WOW's Forever guides** —
  Excitable Slime, Baby Crocolisk, Night Watchman's Torch,
  Graverobber's Shovel (graves still undocumented), the Ruins of
  Lordaeron secret bosses, Brother Zendraas the Windstone vendor,
  three hidden quests (Silver of the Waves, Whispering Horror
  Residue, Malignant Root) and the Drunken Dwarf hidden tavern.
- **Retail: the four summary entries are now full guides** —
  Nazjatar Blood Serpent (20 Abyssal Fragments, Altar of the Abyss,
  Abyssal Icon summon), Bound Shadehound (the full Ve'nari/Rune
  Codex chain with Maw waypoints), Child of Torcali (the Horde
  direhorn-raising questline), and Xy Trustee's Gearglider —
  **corrected**: it is a War Within patch 11.2 secret in the
  Manaforge Omega raid (three Cartel Deals), not Zereth Mortis
  content as v0.2 said.
- Gate extended: per-file counts for the new data files and a
  Library Books count check (37 located books).

## 0.2.0 — 2026-10-23 (pre-release build for in-game testing)

- Catalog grew from 25 to **99 entries (87 Retail + 12 Forever)** —
  the full research catalog: older-world rare camps (Time-Lost
  Proto-Drake, Aeonaxx, Voidtalon, Grey Riding Camel), spirit beasts
  and challenge tames, hidden artifact appearances, the remaining
  Legion/BfA/Shadowlands/Dragonflight/War Within secrets, the first
  Midnight entries (Gortham, J'imothy, Slitherfang, Unfazed Diver,
  Labyrinth of Kindo'jan), and the remaining Forever beta secrets
  (Rockslicer, Coldflame Saber, Wolf's Bane, Druid serpent form, the
  UNSOLVED Keystone Fragment mystery, and the files-only Spring 2027
  legendary — all labeled with their real status).
- **Long-Forgotten Hippogryph completed**: the full known crystal
  point list (110 unique points, transcribed from the Game Detectives
  list) is now included as checkable waypoint steps.
- Mind-Seeker coverage: 29 of the 34 canonical secrets are now in the
  Retail catalog.
- Wicker Pup's four Drustvar chest steps now carry their published
  mapID (896).
- Gate hardened: entry counts per data file, LFH point count,
  duplicate-ID check, and a mapID audit (only report-published mapIDs
  may appear anywhere in the data).
- Still Unverified in game: SEAN cannot test Retail yet and Forever
  does not launch until Nov 4, 2026. Entries whose source research
  could not extract full steps say so in their steps (notably
  Nazjatar Blood Serpent, Child of Torcali, Bound Shadehound, and
  Xy Trustee's Gearglider).

## 0.1.0 — 2026-10-23 (pre-release build for in-game testing)

- First build: categorized catalog UI (search, type filter, hide-solved),
  step-by-step detail view, native waypoints with `/way` fallback,
  quest-flag + manual progress tracking in SavedVariables, and a
  Mind-Seeker progress summary.
- Retail catalog (interface 120105): 21 entries, including the full
  Uuna → Baa'l → Waist of Time dependency chain and Incognitro.
- WoW: Forever catalog (interface 16001, Camelot TOC): 4 beta-earned
  entries. Forever data must be re-verified on the live Nov 4 build.
- Known data limits (stated in the affected entries' steps):
  Long-Forgotten Hippogryph crystal point list and Library Books
  per-book locations are not yet transcribed; a handful of steps have
  zone + text only because their source guides publish no coordinates.
