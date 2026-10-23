# SecretGPS — Verification

Labels: **Verified** (observed in the real client) · **Partially
Verified** (out-of-game gate passed) · **Unverified** (not yet run).

## v0.4.0 — 2026-10-23 (renamed to SecretGPS)

| Check | Result | Label |
|---|---|---|
| Rename sweep: zero `SecretAtlas` strings remain outside git history; folder/TOCs/SavedVariables/slash all SecretGPS; gate re-run immediately after the rename (before new code) | PASS | Partially Verified |
| Lua parse, all 14 .lua files (incl. new Tracker.lua) | PASS | Partially Verified |
| Harness, Retail TOC: TomTom waypoint path (stubbed TomTom.AddWaypoint receives the mapID point), tracker start/stop, Done-advance ticking, tracker skipping the flag-done Lucid step 1, `/sgps wp` + track/untrack slash | PASS | Partially Verified |
| Harness, Forever TOC: same tracker assertions pass; TomTom test notes no mapID steps exist on this client (expected) | PASS | Partially Verified |
| Packaging: both 0.4.0 zips contain Tracker.lua and exactly their TOC file lists | PASS | Partially Verified |
| In-game run — Retail (tracker window, TomTom on a real install) | SEAN cannot test yet | **Unverified** |
| In-game run — Forever | Client launches Nov 4, 2026 | **Unverified** |

## v0.3.0 — 2026-10-23

| Check | Result | Label |
|---|---|---|
| Lua parse, all 13 .lua files | PASS | Partially Verified |
| TOC ↔ disk cross-check, both TOCs | PASS | Partially Verified |
| Data counts: Retail 21 + 29 + 37 = 87 (plus a 0-entry fixes file), Forever 4 + 8 + 10 = 22 (plus the books file), 109 unique entry IDs | PASS | Partially Verified |
| Library Books: 37 located books with coordinates transcribed from the Lost WOW guide (24 EK + 13 Kalimdor), count enforced by the gate; reward tiers corrected to the guide's 10/20/25 tiers | PASS | Partially Verified |
| mapID audit: only audited mapIDs appear (13, 46, 885, 896, 1543, 2025, 2255); the new Maw waypoints use 1543 | PASS | Partially Verified |
| Mocked-frame harness, Retail TOC: 87 entries load and exercise | PASS | Partially Verified |
| Mocked-frame harness, Forever TOC: 22 entries load and exercise | PASS | Partially Verified |
| Packaging: package.py now derives file lists from the TOCs and asserts zip contents == TOC contents (the first v0.3.0 build with hardcoded lists silently omitted the three new files; caught on inspection, fixed, rebuilt) | PASS | Partially Verified |
| In-game run — Retail | SEAN cannot test yet (confirmed 2026-10-23) | **Unverified** |
| In-game run — Forever | Client launches Nov 4, 2026 | **Unverified** |

## v0.2.0 — 2026-10-23

| Check | Result | Label |
|---|---|---|
| Lua parse, all 9 .lua files | PASS | Partially Verified |
| TOC ↔ disk cross-check, both TOCs | PASS | Partially Verified |
| Data counts: Retail 21 + 29 + 37 = 87, Forever 4 + 8 = 12, 99 unique entry IDs (duplicate-ID check in gate) | PASS | Partially Verified |
| LFH crystal list: 110 unique points transcribed from the Game Detectives page the report cites (its list contains one duplicate, included once); each point parse-checked as a step with x/y | PASS | Partially Verified |
| mapID audit across all data files: only report-published mapIDs appear (13, 46, 885, 896, 1543, 2025, 2255) — enforced by the gate | PASS | Partially Verified |
| Mocked-frame harness, Retail TOC: 87 entries load, every entry selects + refreshes (including the 114-step LFH entry), Mind-Seeker counts read 0/29 | PASS | Partially Verified |
| Mocked-frame harness, Forever TOC: 12 entries | PASS | Partially Verified |
| Packaging: both 0.2.0 zips, testzip clean, per-client file separation | PASS | Partially Verified |
| In-game run — Retail | SEAN cannot test yet (confirmed 2026-10-23) | **Unverified** |
| In-game run — Forever | Client launches Nov 4, 2026 | **Unverified** |

## v0.1.0 — 2026-10-23

| Check | Result | Label |
|---|---|---|
| Lua parse, all 6 .lua files (luaparser) | PASS | Partially Verified |
| TOC ↔ disk cross-check, both TOCs (120105 Retail / 16001 Camelot), every listed file exists, no orphan files | PASS | Partially Verified |
| Data counts: Data_Retail.lua = 21 entries, Data_Forever.lua = 4 entries | PASS | Partially Verified |
| Coordinate / ID audit: mapIDs in data are only the source-published set (13, 46, 885, 1543, 2025, 2255); quest flags are only the report's Lucid Nightmare (47826–47885) and Uuna (50098–50109) sets | PASS (grep audit) | Partially Verified |
| Mocked-frame startup harness, Retail TOC: loads, ADDON_LOADED + PLAYER_LOGIN fire, UI builds (BackdropTemplate rule respected — mock grants SetBackdrop only to BackdropTemplate frames), `/sa` toggles, every entry selects + refreshes, native waypoint path taken on a mapID step, flag-47826 step reads done, manual tick toggles on an unflagged step, QUEST_LOG_UPDATE refresh, Mind-Seeker counts read 0/16 | PASS | Partially Verified |
| Mocked-frame startup harness, Forever TOC: same suite, 4 entries | PASS | Partially Verified |
| Packaging: both zips build, `testzip` clean, single top-level `SecretGPS/` folder, each zip excludes the other client's TOC + data | PASS | Partially Verified |
| In-game run — Retail client | NOT RUN — SEAN's test owed | **Unverified** |
| In-game run — Forever client | Cannot run until Forever launches Nov 4, 2026 (beta ended Oct 21) | **Unverified** |
| SavedVariables persistence across a real relog | Mocked only | **Unverified** |
| Step text walked end-to-end in game for all 25 entries | NOT RUN | **Unverified** |

Gate history: the first full gate run FAILED on a harness assertion
(manual tick on Lucid Nightmare step 1, whose quest flag 47826 the
mock reports complete — the addon correctly treats flagged steps as
game-owned). The harness was fixed to tick an unflagged step; the
addon code was not changed. Gate then passed in full.

## v0.5.0 — rename to SecretGPS (2026-10-23)

Renamed SecretsGPS → SecretGPS at SEAN's direction: addon folder,
both TOCs, chat prefix, SavedVariables (`SecretGPSDB` →
`SecretGPSDB`), zip names, all documentation, and the GitHub
repository. (Earlier sections of this document were updated to the
current name in the same sweep; their version labels are unchanged.)
No catalog or feature changes.

| Check | Result | Label |
|---|---|---|
| Gate (luaparser parse of all Lua files, TOC↔disk cross-check, entry counts, duplicate-ID check, LFH 110-point count, Library Books 37 count, mapID audit) | PASS | Partially Verified |
| Mocked-frame harness, both TOCs (boot, every entry selects/refreshes, native + TomTom waypoint paths, tracker start/stop/advance/flag-skip, slash commands incl. `/secretgps`) | PASS | Partially Verified |
| Packaging: `SecretGPS-0.5.0-Retail.zip` + `SecretGPS-0.5.0-Forever.zip` build from the TOC-derived lists, contents == TOC lists, single top-level `SecretGPS/` folder | PASS | Partially Verified |
| Zero `SecretsGPS` strings remain outside git history and the CHANGELOG's historical entries | PASS (grep) | Partially Verified |
| In-game run — both clients | NOT RUN (unchanged from v0.4.0) | **Unverified** |
