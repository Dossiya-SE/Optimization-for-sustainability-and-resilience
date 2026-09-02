from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TEXT_SUFFIXES = {".md", ".tex", ".jl", ".py", ".yml", ".yaml", ".cff", ".bib"}

SECRET_PATTERNS = [
    re.compile(r"sk-proj-[A-Za-z0-9_-]{20,}"),
    re.compile(r"OPENAI_API_KEY\s*=\s*[\"']?sk-", re.IGNORECASE),
]

# Match actual conflict-marker lines without embedding the literal markers
# in this source file, which would make the checker flag itself.
CONFLICT_PATTERNS = [
    re.compile(r"^<{7}(?:\s|$)", re.MULTILINE),
    re.compile(r"^={7}(?:\s|$)", re.MULTILINE),
    re.compile(r"^>{7}(?:\s|$)", re.MULTILINE),
]

errors: list[str] = []
warnings: list[str] = []
checked = 0

for path in sorted(ROOT.rglob("*")):
    if not path.is_file():
        continue
    if ".git" in path.parts:
        continue
    if path.suffix.lower() not in TEXT_SUFFIXES and path.name not in {"README.md", ".gitignore", "LICENSE"}:
        continue

    checked += 1
    try:
        text = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        warnings.append(f"Non-UTF8 file skipped: {path.relative_to(ROOT)}")
        continue

    rel = path.relative_to(ROOT)

    for pattern in SECRET_PATTERNS:
        if pattern.search(text):
            errors.append(f"Possible committed API credential in {rel}")

    if any(pattern.search(text) for pattern in CONFLICT_PATTERNS):
        errors.append(f"Unresolved merge-conflict marker in {rel}")

    trailing = sum(1 for line in text.splitlines() if line.endswith(" ") or line.endswith("\t"))
    if trailing:
        warnings.append(f"{rel}: {trailing} line(s) with trailing whitespace")

    if path.suffix.lower() == ".md":
        fence_count = text.count("```")
        if fence_count % 2 != 0:
            errors.append(f"Unbalanced fenced block in {rel}")

print(f"Checked {checked} text files.")

if warnings:
    print("\nWarnings:")
    for item in warnings:
        print(f"  - {item}")

if errors:
    print("\nErrors:")
    for item in errors:
        print(f"  - {item}")
    sys.exit(1)

print("\nRepository quality checks passed.")
