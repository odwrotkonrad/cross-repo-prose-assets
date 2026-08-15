#!/usr/bin/env zsh
##[>] 🤖🤖
set -euo pipefail

content_dirs=(conventions repos shared templates)

last=$(git describe --tags --abbrev=0 --match 'v[0-9]*' 2>/dev/null || true)
if [[ -z $last ]] {
  print v1.0.0
  exit 0
}

bump=patch
for line in ${(f)"$(git diff --name-status $last..HEAD -- $content_dirs)"}; {
  case ${line[1]} {
    (D|R) bump=major; break ;;
    (A) bump=minor ;;
  }
}

tokens=(${(f)"$(git log $last..HEAD --format=%B | sed -nE 's/.*semver: (major|minor|patch).*/\1/p')"})
if (( ${#tokens} )) {
  bump=patch
  if (( ${tokens[(I)minor]} )) bump=minor
  if (( ${tokens[(I)major]} )) bump=major
}

parts=(${(s:.:)${last#v}})
case $bump {
  (major) print v$((parts[1] + 1)).0.0 ;;
  (minor) print v${parts[1]}.$((parts[2] + 1)).0 ;;
  (patch) print v${parts[1]}.${parts[2]}.$((parts[3] + 1)) ;;
}
##[<] 🤖🤖
