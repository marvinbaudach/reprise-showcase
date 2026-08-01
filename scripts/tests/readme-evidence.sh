#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)
english="$repo_root/README.md"
german="$repo_root/README.de.md"
counted_commit=2e5aff6e4448246cbe3f1ad122cf8f023537bd69

for readme in "$english" "$german"; do
  rg -Fq '241,421' "$readme" || rg -Fq '241.421' "$readme"
  rg -Fq '176,874' "$readme" || rg -Fq '176.874' "$readme"
  rg -Fq '64,547' "$readme" || rg -Fq '64.547' "$readme"
  rg -Fq "$counted_commit" "$readme"
  rg -Fq 'cloc 2.08' "$readme"
  rg -Fq '176.9k' "$readme"
  rg -Fq '64.5k' "$readme"
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
rg -Fq 'More than 300 active rules' "$english"
rg -Fq 'Mehr als 300 aktive Regeln' "$german"
rg -Fq 'Native Kotlin for Android' "$english"
rg -Fq 'Android nativ mit Kotlin' "$german"
rg -Fq 'One Tauri 2 desktop frontend' "$english"
rg -Fq 'Ein Tauri-2-Desktop-Frontend' "$german"
if rg -Fq '#[cfg(test)]-aware analyzer' "$english" "$german"; then
  echo "custom analyzer wording remains" >&2
  exit 1
fi
echo "README evidence contract: OK"
