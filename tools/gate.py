#!/usr/bin/env python3
"""SecretGPS gate: Lua parse + TOC cross-check + harness (both TOCs).

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
ADDON = ROOT / "SecretGPS"
TOCS = ["SecretGPS.toc", "SecretGPS_Camelot.toc"]

VALIDATOR_LUA = r"""
function(ns, expectedGame, types, expansions)
  local bad = {}
  local function add(s) bad[#bad + 1] = s end
  for i = 1, #ns.Entries do
    local e = ns.Entries[i]
    local id = (type(e.id) == "string" and e.id) or ("<entry " .. i .. ">")
    if type(e.id) ~= "string" or e.id == "" then add(id .. ": id missing") end
    if type(e.name) ~= "string" or e.name == "" then add(id .. ": name missing") end
    if not types[e.type] then add(id .. ": type '" .. tostring(e.type) .. "' has no UI label") end
    if not expansions[e.expansion] then add(id .. ": expansion '" .. tostring(e.expansion) .. "' has no UI label") end
    if e.game ~= expectedGame then add(id .. ": game '" .. tostring(e.game) .. "' != " .. expectedGame) end
    if type(e.reward) ~= "string" then add(id .. ": reward missing") end
    if type(e.source) ~= "string" or e.source:sub(1, 4) ~= "http" then add(id .. ": source missing or not http") end
    if e.verifiedPatch == nil then add(id .. ": verifiedPatch missing") end
    if e.mindSeeker ~= nil and type(e.mindSeeker) ~= "boolean" then add(id .. ": mindSeeker not boolean") end
    if e.difficulty ~= nil and (type(e.difficulty) ~= "number" or e.difficulty < 1 or e.difficulty > 5) then add(id .. ": difficulty out of 1..5") end
    if type(e.steps) ~= "table" or #e.steps == 0 then
      add(id .. ": no steps")
    else
      for j = 1, #e.steps do
        local s = e.steps[j]
        if type(s.text) ~= "string" or s.text == "" then add(id .. " step " .. j .. ": text missing") end
        if (s.x == nil) ~= (s.y == nil) then add(id .. " step " .. j .. ": x/y mismatch") end
        if s.x ~= nil and (type(s.x) ~= "number" or s.x < 0 or s.x > 100
            or type(s.y) ~= "number" or s.y < 0 or s.y > 100) then
          add(id .. " step " .. j .. ": coords outside 0..100")
        end
        if s.mapID ~= nil and (s.x == nil or type(s.mapID) ~= "number") then add(id .. " step " .. j .. ": mapID without coords") end
        if s.questFlag ~= nil and type(s.questFlag) ~= "number" then add(id .. " step " .. j .. ": questFlag not a number") end
      end
    end
    if type(e.completion) == "table" and e.completion.questFlags ~= nil then
      for k = 1, #e.completion.questFlags do
        if type(e.completion.questFlags[k]) ~= "number" then add(id .. ": completion questFlag not a number") end
      end
    end
    if e.collection ~= nil then
      if type(e.collection) ~= "table" then
        add(id .. ": collection not a table")
      else
        local k = e.collection.kind
        if k ~= "mount" and k ~= "pet" and k ~= "toy" then add(id .. ": collection.kind '" .. tostring(k) .. "' invalid") end
        if type(e.collection.id) ~= "number" or e.collection.id <= 0 then add(id .. ": collection.id not a positive number") end
      end
    end
  end
  return bad
end
"""

RETAIL_DATA = ["Data_Retail.lua", "Data_Retail_LFH.lua", "Data_Expansions1.lua",
               "Data_Expansions2.lua", "Data_Retail_Fixes.lua",
               "Data_Retail_MindSeeker.lua"]
FOREVER_DATA = ["Data_Forever.lua", "Data_Forever2.lua", "Data_Forever3.lua",
                "Data_Forever_Books.lua"]


def _label_keys(block_name, ui_text):
    m = re.search(block_name + r"\s*=\s*\{(.*?)\n\}", ui_text, re.S)
    if not m:
        return set()
    return set(re.findall(r"(\w+)\s*=", m.group(1)))


def schema_failures():
    try:
        import lupa
    except ImportError:
        return ["lupa not available for schema validation"]
    ui_text = (ADDON / "UI.lua").read_text()
    types = _label_keys("TYPE_LABELS", ui_text)
    expansions = _label_keys("EXPANSION_LABELS", ui_text)
    if not types or not expansions:
        return ["could not extract label tables from UI.lua"]
    lua = lupa.LuaRuntime()
    validate = lua.eval(VALIDATOR_LUA)
    out = []
    for files, game in ((RETAIL_DATA, "retail"), (FOREVER_DATA, "forever")):
        ns = lua.table()
        ns.Entries = lua.table()
        for name in files:
            chunk = lua.compile((ADDON / name).read_text())
            chunk("SecretGPS", ns)
        type_set = lua.table_from({t: True for t in types})
        exp_set = lua.table_from({x: True for x in expansions})
        bad = validate(ns, game, type_set, exp_set)
        problems = [bad[i] for i in range(1, len(bad) + 1)]
        print(f"schema ({game}): {len(ns.Entries)} entries, "
              f"{len(problems)} problem(s)")
        out += [f"schema {game}: {p}" for p in problems]
    return out


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
                       ("Data_Forever3.lua", 10), ("Data_Forever_Books.lua", 0),
                       ("Data_Retail_MindSeeker.lua", 5)]:
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
    # mapID audit: across all data files, only guide-published mapIDs
    # may appear (13 Pearl, 46 Karazhan Catacombs, 885 Antoran, 896
    # Drustvar, 1543 Maw, 2025 Thaldraszus, 2255 Azj-Kahet; v0.6.0
    # added the IDs published by the Warcraft Secrets guides for
    # Tobias/Jumpjets/Scholomance/Wan'be/Felcyclist/Courage/Glimr).
    allowed = {"13", "46", "885", "895", "896", "1543", "2025", "2255",
               "10", "17", "22", "23", "64", "77", "107", "109", "114",
               "115", "116", "210", "376", "539", "554", "630", "650",
               "680", "862", "1533", "2024", "2112"}
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
    # Schema validation: load the data files (TOC order, per client)
    # and validate every entry/step against the catalog schema. Type
    # and expansion values must have labels in UI.lua, so an unlabeled
    # value can never ship silently again.
    failures += schema_failures()
    # Version consistency: both TOCs, Core.lua and package.py must
    # agree on the version string.
    versions = {}
    for toc in TOCS:
        m = re.search(r"^## Version:\s*(\S+)", (ADDON / toc).read_text(), re.M)
        versions[toc] = m.group(1) if m else None
    m = re.search(r'ns\.VERSION = "([^"]+)"', (ADDON / "Core.lua").read_text())
    versions["Core.lua"] = m.group(1) if m else None
    m = re.search(r'^VERSION = "([^"]+)"',
                  (ROOT / "tools" / "package.py").read_text(), re.M)
    versions["package.py"] = m.group(1) if m else None
    if len(set(versions.values())) == 1 and None not in versions.values():
        print(f"version consistency: {versions['Core.lua']} in all 4 places")
    else:
        failures.append(f"version mismatch: {versions}")
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
