# SecretGPS — Verification

Labels: **Verified** (observed in the real client) · **Partially
Verified** (out-of-game gate passed) · **Unverified** (not yet run).

## v0.6.0 — 2026-10-23 (Mind-Seeker completion, data only)

| Check | Result | Label |
|---|---|---|
| New data file `Data_Retail_MindSeeker.lua`: 5 entries (Tobias, Mimiron's Jumpjets, Fashion of the Fanatic Felcyclist, Leaders of Scholomance, Wan'be's Buried Goods) transcribed from the Warcraft Secrets guides opened in-session (Mind-Seeker, Secrets of Azeroth, Memory of Scholomance, Wan'be's Buried Goods, Incognitro) | PASS | Partially Verified |
| Mind-Seeker coverage: harness reads 0/33 — all 33 Seat of Knowledge secret records now carry the flag (the 34th displayed object is the trophy itself); Secrets of Azeroth un-flagged to end the double count | PASS | Partially Verified |
| Summary upgrades: Courage (9 cub waypoints, mapID 1533), Glimr (9-quest chain, 116/114), Enlightened Hearthstone (6 pillar coords, no mapID — the guide publishes none), Gortham (5-conduit mechanic), J'imothy (3 prison locations + channel mechanic, Blizzard Watch) | PASS | Partially Verified |
| Gate: Lua parse (15 files), TOC cross-check (Retail TOC only gains the new data file), per-file counts (Retail 21+29+37+0+5 = 92, Forever 22), 114 unique entry IDs, LFH 110, Library Books 37 | PASS | Partially Verified |
| mapID audit extended to the newly guide-published IDs (10, 17, 22, 23, 64, 77, 107, 109, 114, 115, 116, 210, 376, 539, 554, 630, 650, 680, 862, 895, 1533, 2024, 2112) | PASS | Partially Verified |
| Harness, both TOCs: every entry selects/refreshes, tracker + waypoint paths exercised | PASS | Partially Verified |
| In-game run — Retail: SEAN ran v0.6.0 in the real client 2026-10-23 (screenshot): addon loads, catalog list + Lucid Nightmare detail + steps render, header reads "Mind-Seeker: 0 solved of 33". Tracker window, waypoint clicks, ticking and /reload persistence not yet exercised on camera | PASS (load + render) | Partially Verified |
| In-game run — Forever | Client launches Nov 4, 2026 | **Unverified** |

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

## v0.6.1 — review series release (2026-10-23)

Ships the one-at-a-time review series (A1–A10) plus SEAN's R1
direction (all windows styled like the classic quest log):
layout/tooltip fixes, mouse-wheel scrolling, selection highlight,
Type dropdown with counts, step-text search, quest-update debounce,
tracker advance-while-hidden, minimap button, tracker progress bar
+ completion sound, collected-detection engine (no journal IDs
yet), SavedVariables versioning, and gate schema validation (which
caught and fixed the Housing label and Wan'be expansion-key bugs).

| Check | Result | Label |
|---|---|---|
| Gate (parse, TOC cross-check, entry counts, duplicate IDs, LFH/Books counts, mapID audit, entry/step schema incl. collection field, 4-way version consistency) | PASS | Partially Verified |
| Harness, both TOCs (boot, select-all, waypoints native+TomTom, tracker incl. flag-skip, slash, **type filter / step-text search / hide-solved assertions**, **minimap button exists, has click+drag handlers, and toggles the catalog both ways**) | PASS | Partially Verified |
| Packaging: v0.6.1 Retail (57,931 B) + Forever (29,104 B) zips, contents == TOC lists | PASS | Partially Verified |
| GitHub publish: per-file upserts OK; full-tree blob audit | ALL MATCH | Verified |
| GitHub pre-release v0.6.1 with both zips attached | Published, page read back | Verified |
| In-game — v0.6.1 changes (parchment tiles, minimap button, dropdown, wheel, sound) | NOT RUN — awaits SEAN's walkthrough (v0.6.0 load/render verified in Retail 2026-10-23) | **Unverified** |

## v0.6.2 — the look, fixed (2026-10-23)

Driven by SEAN's live Retail screenshots of v0.6.1 (2026-10-23):
the QuestLogFrame book tiles render as dark slabs over the detail
pane and a giant emblem over the title at catalog size, list text
is unreadable where tile art sits under it, the footer hint and
source line overlap, and the minimap button shows as an empty
ring (the UI-QuestLog-BookIcon path renders blank). SEAN supplied
the target: the classic quest log frame (dark frame, black list
with gold titles, parchment detail).

Fixes: ns.StyleQuestLog / ns.StylePanel rebuilt on backdrop colors
(no legacy art); catalog gains a black list panel (gold titles) and
a parchment detail panel; tracker gains a parchment step panel;
minimap + title emblem use the INV_Misc_Book_09 item icon with
fallbacks; footer hint (left) and source (right) no longer share
space; version bumped to 0.6.2 in all four places.

| Check | Result | Label |
|---|---|---|
| Gate (incl. backdrop rule extended to Core.lua stylers, 4-way version consistency 0.6.2) | PASS (exit 0) | Partially Verified |
| Harness, both TOCs (boot, interactions, minimap assertions included) | PASS | Partially Verified |
| Packaging: v0.6.2 Retail (58,642 B) + Forever (29,814 B) zips, contents == TOC lists | PASS | Partially Verified |
| GitHub publish: per-file upserts OK; full-tree blob audit (29 files) | ALL MATCH | Verified |
| GitHub pre-release v0.6.2 with both zips attached | Published, page read back | Verified |
| In-game — v0.6.2 look (dark frame, panels, minimap book icon) | NOT RUN — awaits SEAN's next screenshot | **Unverified** |
