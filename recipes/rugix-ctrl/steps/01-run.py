#!/usr/bin/env python3

import os
import pathlib
import sys

RUGIX_ROOT_DIR = os.environ.get("RUGIX_ROOT_DIR", None)

if RUGIX_ROOT_DIR is not None:
    fstab = pathlib.Path(RUGIX_ROOT_DIR) / "etc" / "fstab"
else:
    try:
        fstab = pathlib.Path(sys.argv[1])
    except IndexError:
        print(f"usage: {sys.argv[0]} <fstab>")
        sys.exit(1)

original = fstab.read_text()
lines = []

for line in original.splitlines():
    parts = line.split()
    if len(parts) < 2:
        continue
    if parts[1] in {"/", "/boot", "/boot/firmware"}:
        continue
    lines.append(line)

fstab.write_text("\n".join(lines))
