#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_root"

fail() {
  echo "$1" >&2
  exit 1
}

mapfile -t readmes < <(find . -maxdepth 1 -type f -name 'README*.md' -printf '%f\n' | sort)
[[ ${#readmes[@]} -eq 2 ]] || fail "showcase must contain exactly English and German READMEs"
[[ ${readmes[0]} == README.de.md && ${readmes[1]} == README.md ]] ||
  fail "showcase README languages must be English and German"

for readme in README.md README.de.md; do
  [[ $(rg -o 'href="README\.md">English</a>' "$readme" | wc -l) -eq 1 ]] ||
    fail "$readme must link English exactly once"
  [[ $(rg -o 'href="README\.de\.md">Deutsch</a>' "$readme" | wc -l) -eq 1 ]] ||
    fail "$readme must link German exactly once"
  if rg -q 'README\.(fr|es|it)\.md|Français|Español|Italiano' "$readme"; then
    fail "$readme must not advertise removed translations"
  fi
done

rg -Fq '## Architecture direction' README.md
rg -Fq '## Architekturrichtung' README.de.md
rg -Fq 'Native Kotlin for Android' README.md
rg -Fq 'Android nativ mit Kotlin' README.de.md
rg -Fq 'Tauri 2' README.md
rg -Fq 'Tauri 2' README.de.md
rg -Fq 'MCP and CLI adapters' README.md
rg -Fq 'MCP- und CLI-Adapter' README.de.md

for readme in README.md README.de.md; do
  if rg -qi '\biOS\b' "$readme"; then
    fail "$readme must not retain iOS in the Reprise roadmap"
  fi
done

rg -Fq 'product%20code-176.9k%20lines' README.md
rg -Fq 'test%20code-64.5k%20lines' README.md
rg -Fq 'Produktcode-176.9k%20Zeilen' README.de.md
rg -Fq 'Testcode-64.5k%20Zeilen' README.de.md
rg -Fq '| Rust code | 241,421 lines |' README.md
rg -Fq '| — product code | 176,874 lines |' README.md
rg -Fq '| — test code | 64,547 lines |' README.md
rg -Fq '| Rust-Code | 241.421 Zeilen |' README.de.md
rg -Fq '| — Produktcode | 176.874 Zeilen |' README.de.md
rg -Fq '| — Testcode | 64.547 Zeilen |' README.de.md
rg -Fq '17 merge gates' README.md
rg -Fq '17 Merge-Gates' README.de.md
rg -Fq '2e5aff6e44' README.md
rg -Fq '2e5aff6e44' README.de.md
rg -Fq 'cloc 2.08' README.md
rg -Fq 'cloc 2.08' README.de.md

if rg -q 'analysis-driven visuals|generative audio \+ visuals|\| \*\*Distribution\*\*' README.md ||
  rg -q 'analysebasierte Visuals|generatives Audio \+ Visuals|\| \*\*Distribution\*\*' README.de.md; then
  fail "architecture goals must contain architecture directions only"
fi

if rg -qi 'engineering at a glance|engineering auf einen blick|reprise-engineering-at-a-glance' \
  README.md README.de.md ||
  find assets -maxdepth 1 -type f -name 'reprise-engineering-at-a-glance*.svg' -print -quit | rg -q .; then
  fail "showcase must not retain the low-information overview graphic"
fi

if find assets -maxdepth 1 -type f \
  \( -name '*-fr.svg' -o -name '*-es.svg' -o -name '*-it.svg' \) -print -quit | rg -q .; then
  fail "showcase must not retain unused French, Spanish, or Italian visuals"
fi

for visual in \
  assets/reprise-architecture.svg \
  assets/reprise-architecture-de.svg \
  assets/reprise-performance.svg \
  assets/reprise-performance-de.svg; do
  [[ -f $visual ]] || fail "missing bilingual visual: $visual"
  xmllint --noout "$visual"
done

rg -Fq 'Where behavior lives.' assets/reprise-architecture.svg
rg -Fq 'Wo Verhalten lebt.' assets/reprise-architecture-de.svg
rg -Fq 'NEXT · ANDROID' assets/reprise-architecture.svg
rg -Fq 'NATIVE KOTLIN' assets/reprise-architecture.svg
rg -Fq 'LATER · TAURI 2 DESKTOP' assets/reprise-architecture.svg
rg -Fq 'DANACH · ANDROID' assets/reprise-architecture-de.svg
rg -Fq 'NATIV MIT KOTLIN' assets/reprise-architecture-de.svg
rg -Fq 'SPÄTER · TAURI 2 DESKTOP' assets/reprise-architecture-de.svg
rg -Fq 'One index, two measured wins.' assets/reprise-performance.svg
rg -Fq 'Ein Index, zwei gemessene Effekte.' assets/reprise-performance-de.svg

echo "Bilingual showcase contract passed"
