# SecretsGPS — Design & Architecture

## Product shape

One codebase, two clients. The Retail TOC (`SecretsGPS.toc`, interface
120105) loads `Data_Retail.lua`; the Forever TOC
(`SecretsGPS_Camelot.toc`, interface 16001) loads `Data_Forever.lua`.
All other files are shared. Game-specific data is separated by TOC load
list, not by runtime project-ID branching.

## Files

- `Core.lua` — namespace, SavedVariables defaults, slash commands
  (`/sa`, `/secretsgps`), login/event wiring, `/sa debug` diagnostics.
- `Progress.lua` — quest-flag checks (`C_QuestLog.IsQuestFlaggedCompleted`,
  capability-probed with a guarded legacy fallback), manual step ticks,
  entry-solved logic, Mind-Seeker counts.
- `Waypoints.lua` — native user waypoint via `C_Map.SetUserWaypoint`
  when a step has a verified mapID; otherwise prints the `/way` line
  for TomTom. TomTom is an optional dependency only; no TomTom code is
  bundled.
- `UI.lua` — one movable window: search + type filter + hide-solved,
  catalog list (left), detail + steps (right). Paged rows instead of
  scroll-frame templates, for predictable behavior on both clients.
- `Data_Retail.lua` / `Data_Forever.lua` — the catalog. Transcribed
  from the Oct 23 research report, which itself cites community guides
  (chiefly Warcraft Secrets). Facts only: coordinates, mapIDs, and
  quest IDs appear exclusively where a source publishes them.

## Entry schema

```
id, name, type, expansion, game, zone, reward,
mindSeeker (bool), solo ("Solo"/"Group..."/bool in legacy Forever data),
groupSize, difficulty (1-5), estTime, timeGate, rng, prereq, status,
source (guide URL, shown in-game), verifiedPatch,
completion = { questFlags = {ids} },
steps = { { text, zone, mapID, x, y, questFlag, note } }
```

Coordinates are TomTom-style 0–100 values. Waypoint conversion divides
by 100 for `UiMapPoint.CreateFromCoordinates`.

## Platform rules (binding)

- Modern Mainline API only; Lua 5.1 (no `//`, no bitwise operators).
- Never call `SetBackdrop` on a plain frame — backdrop frames are
  created with the `BackdropTemplate` template (Forever build 70450
  verified: plain frames have no SetBackdrop).
- No combat data, no secret values, no automation. The addon displays
  navigation/checklist state only — the allowed category under
  Blizzard's UI policy (TomTom/HandyNotes precedent).
- Declare file-scope locals before use (call-before-declare of a
  file-scope local silently resolves to a global/nil — BuffRadar
  lesson). Shared functions hang off `ns` to keep load order simple.
- Capability-probe APIs (`C_QuestLog`, `C_Map`, `UiMapPoint`) instead
  of assuming them.

## Verification labels

Every claim about runtime behavior is Verified, Partially Verified, or
Unverified. Out-of-game gates (Lua parse, TOC cross-check, mocked-frame
startup harness) are Partially Verified at best; only SEAN's in-game
runs are Verified.
