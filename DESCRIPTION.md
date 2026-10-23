# SecretGPS

**Every hidden secret in WoW, in one catalog — pick one, follow the
steps, get the thing.**

World of Warcraft is full of collectibles the game never tells you
about: puzzle mounts, secret pets, hidden toys, class-locked
treasures, and mysteries the community is still solving. SecretGPS
collects them into one categorized window, walks you to each one
with a short step-by-step guide and map waypoints, and remembers
what you've already done.

One addon, two games: **WoW Retail** (patch 12.1.5) and
**WoW: Forever** — each client loads only its own catalog.

## What it does

- **Shows you the whole board.** 109 secrets (87 Retail, 22
  Forever) in one window, organized by what you get: mounts, pets,
  toys, transmog, titles, questlines and more. Search by name,
  zone or reward; filter by type; hide what you've solved.
- **Walks you through each one.** Every secret has a short,
  ordered guide with the prerequisites, difficulty, time gates and
  RNG warnings up front — no alt-tabbing through five-year-old
  forum threads.
- **Guides you, live.** Hit **Track** on any secret — or on any
  single step, when the thing you need is one NPC, item or place —
  and the small **SecretTracker** window opens: it shows the
  current step, sets its waypoint (through **TomTom** if you have
  it, otherwise the game's own pin), and advances step by step as
  you complete each one, on its own when the game records a step
  done.
- **Knows what you've done.** Steps tied to hidden quest flags
  tick themselves off from the game's own records; tick the rest
  manually. Progress is saved between sessions.
- **Tracks Mind-Seeker.** The secrets that count toward the
  Mind-Seeker Feat of Strength are flagged, with a running count
  toward the 17-of-34 needed for the title.
- **Tracks the mysteries too.** Unsolved and partly solved secrets
  (like Forever's Stone Key) are in the catalog, labeled honestly
  with exactly what is and isn't known.

## How to use it

1. Type `/sgps` (or `/secretgps`) to open the catalog.
2. Pick a secret on the left; its guide appears on the right.
3. Hit **Track this secret** and follow the SecretTracker window:
   waypoint set, step by step, until it's yours.

Commands: `/sgps track` (show/hide the tracker), `/sgps wp
auto|native|tomtom` (waypoint provider), `/sgps mindseeker`
(progress), `/sgps debug` (diagnostics), `/sgps reset` (clear
manual ticks), `/sgps help`.

## About the data

Every entry credits the community guide it was transcribed from —
chiefly Warcraft Secrets and Lost WOW (the Secret Finding
community's guides), Wowhead, Icy Veins, Method and the Game
Detectives wiki. Coordinates appear only where a source publishes
them; SecretGPS never guesses a location, and entries whose
steps couldn't be fully sourced say so in their own text.

Forever entries come from the Forever beta and will be re-verified
on the live client after its November 4, 2026 launch. SecretGPS
is renamed from the original SecretAtlas builds; the catalog data
is complete for v0.5.0, and in-game walkthrough verification is in
progress.

## License

MIT. Created by Sean Shaffer. SecretGPS only displays
information and sets waypoints — it does not automate gameplay.
