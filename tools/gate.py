#!/usr/bin/env python3
"""SecretsGPS gate: Lua parse + TOC cross-check + harness (both TOCs).

Run: python3 tools/gate.py
Exit 0 only when every check passes. This gate proves the files parse
and the addon boots against a mocked API - it does NOT prove in-game
behavior (that label stays Unverified until a real client run).
"""
import pathlib
import re
import subprocess
import sys

from luaparser import ast

ROOT = pathlib.Path(__file__).resolve().parent.parent
ADDON = ROOT / "SecretsGPS"
TOCS = ["SecretsGPS.toc", "SecretsGPS_Camelot.toc"]


def main():
    failures = []
    lua_files = sorted(ADDON.glob("*.lua"))
    for path in lua_files:
        try:
            ast.parse(path.read_text())
            print(f"parse ok: {path.name}")
        except Exception as exc:  # luaparser raises several types
            failures.append(f"parse FAIL {path.name}: {exc}")
    toc_listed = set()
    for toc in TOCS:
        lines = (ADDON / toc).read_text().splitlines()
        listed = [ln.strip() for ln in lines if ln.strip().endswith(".lua")]
        iface = [ln for ln in lines if ln.startswith("## Interface:")]
        print(f"{toc}: interface {iface} files {listed}")
        for name in listed:
            toc_listed.add(name)
            if not (ADDON / name).exists():
                failures.append(f"{toc} lists missing file {name}")
    for path in lua_files:
        if path.name not in toc_listed:
            failures.append(f"{path.name} exists but is in no TOC")
    # Backdrop rule: SetBackdrop may only be *called* in UI files
    # (UI.lua, Tracker.lua), where every backdrop frame is created
    # with BackdropTemplate.
    for path in lua_files:
        text = path.read_text()
        if "SetBackdrop(" in text and path.name not in ("UI.lua", "Tracker.lua"):
            failures.append(f"{path.name} calls SetBackdrop outside UI files")
    for ui_name in ("UI.lua", "Tracker.lua"):
        ui = (ADDON / ui_name).read_text()
        if "SetBackdrop(" in ui and "BackdropTemplate" not in ui:
            failures.append(f"{ui_name} calls SetBackdrop without BackdropTemplate")
    for data, want in [("Data_Retail.lua", 21), ("Data_Expansions1.lua", 29),
                       ("Data_Expansions2.lua", 37), ("Data_Retail_Fixes.lua", 0),
                       ("Data_Forever.lua", 4), ("Data_Forever2.lua", 8),
                       ("Data_Forever3.lua", 10), ("Data_Forever_Books.lua", 0)]:
        p = ADDON / data
        if p.exists():
            n = len(re.findall(r"^Add\(\{", p.read_text(), re.M))
            print(f"{data}: {n} entries (want {want})")
            if n != want:
                failures.append(f"{data} has {n} entries, want {want}")
        else:
            failures.append(f"{data} missing")
    # LFH point list: exactly 110 unique points transcribed from the
    # Game Detectives list (source contains one duplicate).
    lfh = ADDON / "Data_Retail_LFH.lua"
    pts = len(re.findall(r"^    \{ ", lfh.read_text(), re.M))
    print(f"Data_Retail_LFH.lua: {pts} points (want 110)")
    if pts != 110:
        failures.append(f"LFH points {pts}, want 110")
    # Library Books: 37 located books transcribed from the Lost WOW
    # guide (24 Eastern Kingdoms + 13 Kalimdor), plus one no-coords
    # Blackrock Mountain step appended separately.
    books = ADDON / "Data_Forever_Books.lua"
    nb = len(re.findall(r"text = \"Book:", books.read_text()))
    print(f"Data_Forever_Books.lua: {nb} located books (want 37)")
    if nb != 37:
        failures.append(f"Library books {nb}, want 37")
    # mapID audit: across all data files, only report-published mapIDs
    # may appear (13 Pearl, 46 Karazhan Catacombs, 885 Antoran, 896
    # Drustvar, 1543 Maw, 2025 Thaldraszus, 2255 Azj-Kahet).
    allowed = {"13", "46", "885", "896", "1543", "2025", "2255"}
    for path in lua_files:
        for mid in re.findall(r"mapID\s*=\s*(\d+)", path.read_text()):
            if mid not in allowed:
                failures.append(f"{path.name} uses unaudited mapID {mid}")
    # Duplicate entry ids across all data files are a hard failure.
    ids = []
    for path in lua_files:
        ids += re.findall(r'^\s*id\s*=\s*"([^"]+)"', path.read_text(), re.M)
    dupes = {i for i in ids if ids.count(i) > 1}
    if dupes:
        failures.append(f"duplicate entry ids: {sorted(dupes)}")
    else:
        print(f"entry ids: {len(ids)} unique")
    for toc in TOCS:
        proc = subprocess.run(
            [sys.executable, str(ROOT / "tools" / "harness.py"), toc],
            capture_output=True, text=True)
        print(proc.stdout)
        if proc.returncode != 0:
            failures.append(f"harness FAIL for {toc}")
            print(proc.stderr)
    if failures:
        print("GATE: FAIL")
        for f in failures:
            print(" -", f)
        sys.exit(1)
    print("GATE: PASS (parse + toc cross-check + both harnesses)")


if __name__ == "__main__":
    main()
