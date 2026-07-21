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
rg -Fq 'One index, two measured wins.' assets/reprise-performance.svg
rg -Fq 'Ein Index, zwei gemessene Effekte.' assets/reprise-performance-de.svg

echo "Bilingual showcase contract passed"
