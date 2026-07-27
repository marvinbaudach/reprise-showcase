#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)
english="$repo_root/README.md"
german="$repo_root/README.de.md"
counted_commit=144672eaefed5a8b7b8fc5e3eb6e2d54a08fae0d

for readme in "$english" "$german"; do
  rg -Fq '175,286' "$readme" || rg -Fq '175.286' "$readme"
  rg -Fq '108,095' "$readme" || rg -Fq '108.095' "$readme"
  rg -Fq '67,191' "$readme" || rg -Fq '67.191' "$readme"
  rg -Fq "$counted_commit" "$readme"
  rg -Fq 'cloc 2.08' "$readme"
  rg -Fq '108.1k' "$readme"
  rg -Fq '67.2k' "$readme"
  rg -Fq 'CAVA' "$readme"
done

for feature in \
  'Podcasts and radio' \
  'Concerts and releases' \
  'Instrumental versions'; do
  rg -Fq "$feature" "$english"
done

for feature in \
  'Podcasts und Radio' \
  'Konzerte und Releases' \
  'Instrumentalfassungen'; do
  rg -Fq "$feature" "$german"
done

rg -Fq 'Impact-Site-Verification: 69d5267a-19f8-4452-a03b-a0908549e51b' "$english"
rg -Fq '2,693' "$english"
rg -Fq '2.693' "$german"
rg -Fq '165 active rules' "$english"
rg -Fq '165 aktive Regeln' "$german"

echo "README evidence contract: OK"
