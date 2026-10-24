#!/usr/bin/env python3
"""Create the HalalFrFr project-memory files without overwriting by default."""

from __future__ import annotations

import argparse
import shutil
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Scaffold HalalFrFr project memory.")
    parser.add_argument("--project", required=True, help="Target project directory")
    parser.add_argument(
        "--replace",
        action="store_true",
        help="Replace existing template files. This is destructive and should be explicitly approved.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    skill_dir = Path(__file__).resolve().parent.parent
    source = skill_dir / "assets" / "project"
    target = Path(args.project).expanduser().resolve()

    if not source.is_dir():
        raise SystemExit(f"Template directory not found: {source}")

    target.mkdir(parents=True, exist_ok=True)
    created: list[str] = []
    replaced: list[str] = []
    preserved: list[str] = []

    for src in sorted(source.rglob("*")):
        rel = src.relative_to(source)
        dst = target / rel
        if src.is_dir():
            dst.mkdir(parents=True, exist_ok=True)
            continue

        dst.parent.mkdir(parents=True, exist_ok=True)
        if dst.exists() and not args.replace:
            preserved.append(str(rel))
            continue

        existed = dst.exists()
        shutil.copy2(src, dst)
        (replaced if existed else created).append(str(rel))

    print(f"Project memory target: {target}")
    print(f"Created: {len(created)}")
    print(f"Replaced: {len(replaced)}")
    print(f"Preserved: {len(preserved)}")
    if preserved:
        print("Existing files were preserved. Merge updates through the agent instead of overwriting them blindly.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
