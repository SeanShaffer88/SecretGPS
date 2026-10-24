# SecretGPS

## TL;DR

SecretGPS is a World of Warcraft addon that catalogs hidden collectibles and secrets — the puzzle mounts, secret pets, hidden toys, and class-locked treasures the game never tells you about — and walks you to each one. Pick a secret from the categorized catalog, and SecretGPS shows you a short step-by-step guide, sets a waypoint for each step, and ticks steps off automatically when the game itself records them as done. It ships for both modern WoW (Retail, patch 12.1.5) and WoW: Forever.

See also: `FEATURES.md` (the full feature list), `DESCRIPTION.md` (store-listing description), `CHANGELOG.md` (version history).

## What it does

- **Categorized catalog** — browse by reward type (mounts, pets, toys, transmog, titles, questlines, and more), expansion, and whether a secret is solo, group, or time-gated. Search by name, zone, reward, or words inside a secret's steps.
- **Step-by-step guides** — every entry is a short, ordered route written for in-game use, with prerequisites, difficulty, estimated time, and time-gate/RNG notes up front.
- **SecretTracker window** — hit **Track this secret** (or **Trk** on any single step to start from there) and a small window stays on screen guiding you step by step: current step, progress %, one-click waypoint, a Done button that ticks the step and advances, and automatic advancement when the game itself completes a quest-flag step. Tracking survives reloads.
- **Waypoints** — steps with published coordinates get a map pin in one click: through **TomTom** if you have it installed, otherwise Blizzard's native waypoint — your choice (`/sgps wp auto|native|tomtom`). Steps without a verified map ID print a copyable `/way` line instead.
- **Progress that knows** — steps tied to hidden quest flags are checked against the game itself, so a step you finished months ago is already ticked. Anything else can be ticked manually, and progress is saved between sessions.
- **Mind-Seeker tracker** — the catalog tracks the secrets that count toward the Mind-Seeker Feat of Strength and shows how close you are to the 17-of-34 needed for the title.
- **Looks the part** — both windows are styled after the classic quest log: a dark frame, a black list panel with gold titles, and parchment guide pages with ink text. A book button lives on your minimap: left-click for the catalog, right-click for the tracker, drag to move it.

## The catalog (114 secrets)

**Retail (92):** the complete research catalog — the famous puzzle chains (Lucid Nightmare, Riddler's Mind-Worm, Kosumoth, The Hivemind, Uuna → Baa'l → Waist of Time, Incognitro), the Shadowlands/Dragonflight/War Within secrets, the first Midnight secrets (Mind-Seeker meta, Gortham, Unfazed Diver, Labyrinth of Kindo'jan), evergreen rare camps (Time-Lost Proto-Drake, Aeonaxx, Voidtalon), spirit beasts, hidden artifact appearances, and more. The Long-Forgotten Hippogryph entry includes the full 110-point crystal list as checkable waypoints. All 33 Mind-Seeker secret records are cataloged (the Seat of Knowledge displays those 33 records plus the Mind-Seeker trophy itself).

**WoW: Forever (22):** Cozy Sleeping Bag · Library Books (with all located book spots and the Truthseeker's Bow reward tier) · Musical Gustjumper · Tome of Dalaran: Lyn the Ignored · Rockslicer · First Mate Band · Druid Serpent Form · Wolf's Bane · Coldflame Saber · Blessing of Kalimdor (files-only) · Keystone Fragment Mystery (unsolved) · Spring 2027 Legendary (files-only) · Excitable Slime · Baby Crocolisk · Night Watchman's Torch · Graverobber's Shovel · Ruins of Lordaeron: Secret Bosses · Brother Zendraas (Windstone Vendor) · Silver of the Waves · Whispering Horror Residue · Malignant Root · The Drunken Dwarf (hidden tavern)

Every entry credits its source guide in-game. Coordinates appear only where a source guide publishes them; steps without published coordinates say so instead of guessing.

## Commands

- `/sgps` or `/secretgps` (or `/sa`) — open/close the catalog
- `/sgps track` — show/hide the SecretTracker window
- `/sgps untrack` — stop tracking
- `/sgps wp auto|native|tomtom` — choose the waypoint provider
- `/sgps text` — cycle the text size (100–145%, default 120%)
- `/sgps mindseeker` — print your Mind-Seeker progress
- `/sgps debug` — version, entry count, and API availability diagnostics
- `/sgps reset` — clear manual ticks (game-recorded progress is unaffected)
- `/sgps help`

## Install

Unzip so the `SecretGPS` folder sits in your client's `Interface/AddOns/` folder. Retail uses `SecretGPS.toc` (interface 120105); WoW: Forever uses `SecretGPS_Camelot.toc` (interface 16001). Each client loads only its own game's catalog.

## Honest limits

- v0.6.7 is a pre-release build for in-game testing. Retail data is transcribed from community guides (chiefly Warcraft Secrets, the Secret Finding community's guide site, plus Wowhead, Icy Veins, Method and Lost WOW) and verified against patch 12.1.5 documentation. The addon itself has been run in the live Retail client — loading and catalog rendering are verified (2026-10-23) — but not every entry has been walked end-to-end in game, and the v0.6.5–v0.6.7 changes await a full walkthrough.
- Renamed from SecretAtlas in v0.4.0, and to SecretGPS in v0.5.0. The SavedVariables store was renamed each time, so any progress from earlier test builds resets once on upgrade.
- WoW: Forever entries come from the Forever beta and must be re-verified on the live client after its November 4, 2026 launch.
- A few entries are still summaries where full community steps could not be extracted (some Midnight pets and a handful of older pets/toys). Those entries say so in their steps rather than guessing. The four v0.2 summary mount entries (Nazjatar Blood Serpent, Child of Torcali, Bound Shadehound, Xy Trustee's Gearglider) and the Library Books locations were completed in v0.3.0 from Warcraft Secrets, Icy Veins, Blizzard Watch, Method and Lost WOW guides.
- SecretGPS only displays information and sets waypoints. It does not automate gameplay, and it never touches combat data.

## Screenshots

Screenshots will be added from real runs (see `docs/screenshots/CAPTURE.md` for the capture list).

## License

MIT — see `LICENSE`.
