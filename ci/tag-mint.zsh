#!/usr/bin/env zsh
##[>] 🤖🤖
set -euo pipefail

head_tag=$(git tag --points-at HEAD | grep -E '^v[0-9]' || true)
if [[ -n $head_tag ]] {
  print "HEAD already tagged $head_tag, nothing to mint"
  exit 0
}

next=$(${0:a:h}/semver-bump.zsh)
git tag $next

if [[ -n ${CI:-} ]] {
  git push https://prose-tag-minter:${PROSE_TAG_TOKEN}@${CI_SERVER_HOST}/${CI_PROJECT_PATH}.git $next
} else {
  git push origin $next
}
print "minted $next"
##[<] 🤖🤖
