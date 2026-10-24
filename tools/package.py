#!/usr/bin/env python3
"""Build the two SecretGPS release zips.

File lists are derived from the TOCs themselves (the exact files each
client loads, in load order) plus the TOC file, so a data file added
to a TOC can never be silently left out of its zip - the v0.3.0 build
caught exactly that failure mode with hardcoded lists. Each zip
excludes the other client's TOC and data files so a client can never
load the wrong catalog.
"""
import pathlib
import sys
import zipfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
ADDON = ROOT / "SecretGPS"
VERSION = "0.6.8"
VARIANTS = {
    "Retail": "SecretGPS.toc",
    "Forever": "SecretGPS_Camelot.toc",
}


def toc_files(toc_name):
    lines = (ADDON / toc_name).read_text().splitlines()
    lua = [ln.strip() for ln in lines if ln.strip().endswith(".lua")]
    return [toc_name] + lua


def main():
    failures = []
    for variant, toc_name in VARIANTS.items():
        files = toc_files(toc_name)
        out = ROOT / f"SecretGPS-{VERSION}-{variant}.zip"
        with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as zf:
            for name in files:
                zf.write(ADDON / name, f"SecretGPS/{name}")
        with zipfile.ZipFile(out) as zf:
            names = zf.namelist()
            bad = zf.testzip()
        want = {f"SecretGPS/{n}" for n in files}
        if set(names) != want or bad is not None:
            failures.append(f"{out.name}: contents {sorted(names)} != toc {sorted(want)} bad={bad}")
        print(f"{out.name}: {names}")
    if failures:
        print("PACKAGE: FAIL")
        for f in failures:
            print(" -", f)
        sys.exit(1)
    print("PACKAGE: PASS")


if __name__ == "__main__":
    main()
