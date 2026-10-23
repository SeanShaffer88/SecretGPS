# SecretGPS — Features

The full feature list for the SecretGPS addon (v0.5.0). For the
short version see `README.md`; for store-listing copy see
`DESCRIPTION.md`.

## SecretTracker (new in v0.4.0)

- **Track any secret** from its catalog page, or **track from any
  single step** (the Trk button) to start mid-guide — tracking an
  NPC, item or place a step is about means tracking that step.
- A **small tracker window** opens and stays on screen: secret
  name, current step text and zone, step count and % complete.
- **It leads you**: tracking (and every advance) sets the current
  step's waypoint automatically.
- **Done button** ticks a manual step and advances to the next
  unfinished one; **Prev** goes back; **Stop** ends tracking.
- **Quest-flag steps advance themselves**: when the game records
  the step complete, the tracker moves on and sets the next
  waypoint.
- Tracking **persists across sessions** — reload or log back in
  and the tracker reopens where you left it.
- The catalog marks the tracked secret with `>>` and its button
  becomes "Open tracker".

## Waypoints & TomTom

- **Provider setting** (`/sgps wp auto|native|tomtom`): with
  `auto`, waypoints go through **TomTom** when it is installed
  (its public AddWaypoint API — nothing is bundled) and through
  Blizzard's native waypoint otherwise; `native` and `tomtom`
  force one or the other.
- Steps with a published map ID and coordinates set a pin in one
  click. Steps without a verified map ID print a copyable `/way`
  line instead.
- Coordinates are never invented: a step without sourced
  coordinates says so in its text.

## Catalog

- **114 secrets and hidden collectibles** — 92 for WoW Retail
  (patch 12.1.5) and 22 for WoW: Forever, each client loading only
  its own game's catalog from the same codebase.
- **Categorized browsing** by reward type: mounts, pets, toys,
  transmog, titles, achievements, questlines, hunter pets, druid
  forms, vendors, housing items and Forever items.
- **Search** across names, zones, rewards and step text.
- **Filters**: reward type, plus a hide-solved toggle.
- **Per-entry facts up front**: reward, solo/group, difficulty
  (1–5), estimated time, time gates, RNG notes, prerequisites, and
  an honest status label — solved, partly solved, **UNSOLVED**,
  files-only, or not obtainable — so nothing is oversold.
- **Source credit on every entry**: the guide each entry was
  transcribed from is named in-game (chiefly Warcraft Secrets, Lost
  WOW, Wowhead, Icy Veins, Method and the Game Detectives wiki).

## Step-by-step guides

- Every entry is a short, ordered route written for in-game use.
- Steps carry their zone and, where a source guide publishes them,
  coordinates.
- Long lists are first-class: the Long-Forgotten Hippogryph entry
  contains the full 110-point crystal list, and the Library Books
  entry contains every located book as its own checkable step.

## Progress tracking

- **Quest-flag detection**: steps tied to hidden quest flags are
  checked against the game itself, so work you finished months ago
  is already ticked when you open the entry.
- **Manual ticks** for everything else, with per-entry solved
  state derived from its steps.
- Progress **persists between sessions** (SavedVariables), per
  character.
- `/sgps reset` clears manual ticks only — game-recorded progress
  is never touched.

## Mind-Seeker tracker

- The catalog tracks the secrets that count toward the
  **Mind-Seeker** Feat of Strength (solve 17 for the title):
  all 33 secret records are cataloged in v0.6.0.
- `/sgps mindseeker` prints your solved/total counts at any time.

## Interface (v0.6.1)

- **Classic quest log styling**: both windows are parchment book
  pages with ink-brown text, in the style of the classic quest log.
- **Minimap button**: quest-log book icon on the minimap —
  left-click toggles the catalog, right-click toggles the tracker,
  drag to reposition (position saved).
- **Tooltips everywhere**, mouse-wheel scrolling in both lists, a
  highlighted selected row, and a Type dropdown menu with counts.
- **SecretTracker progress bar** and a completion sound, and the
  tracker advances its saved step even while hidden.

## Commands

- `/sgps` or `/secretgps` (or `/sa`) — open/close the catalog
- `/sgps track` — show/hide the SecretTracker window
- `/sgps untrack` — stop tracking
- `/sgps wp auto|native|tomtom` — waypoint provider
- `/sgps mindseeker` — print Mind-Seeker progress
- `/sgps debug` — version, entry count, API availability diagnostics
- `/sgps reset` — clear manual ticks
- `/sgps help` — command list

## Design rules the addon follows

- Display and waypoints only: **no gameplay automation**, no
  combat data, no secret-values workarounds.
- Capability-probed modern APIs (the same rules on both clients);
  no plain-frame backdrop calls — the Forever client's rules are
  respected by construction.
- Local data only, works fully offline, no networking, no
  telemetry.

## Not in this version

- Per-entry journal IDs for the collected detection above (the
  engine ships in v0.6.1; the IDs are being sourced from the
  journals' publishers and land in a data update — until then
  progress is quest flags + manual ticks).
- 3D reward previews.
- In-game verification: v0.6.1 is a pre-release build. Retail load
  and catalog rendering were verified in the live client on
  2026-10-23; the v0.6.1 interface changes and all interaction
  paths await a live walkthrough, and the Forever data (from the
  beta) awaits the live client (Forever launches November 4,
  2026).
