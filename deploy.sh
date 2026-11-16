#!/usr/bin/env bash
# Push to GitHub, then have cPanel pull and deploy site/ into public_html.
# Needs the "wedig" host alias in ~/.ssh/config (port 22000, key id_ed25519_wedig).
set -euo pipefail

cd "$(dirname "$0")"

if [ -n "$(git status --porcelain)" ]; then
  echo "You have uncommitted changes. Commit them first, then run ./deploy.sh" >&2
  exit 1
fi

git push origin main

ssh wedig '
  set -e
  cd ~/repositories/wedig-earthworks
  git pull --ff-only origin main
  uapi VersionControlDeployment create repository_root=$HOME/repositories/wedig-earthworks >/dev/null
  sleep 3
  echo "Deployed commit: $(git log -1 --format="%h %s")"
'

curl -s -o /dev/null -w "Live site: HTTP %{http_code}\n" https://wedigearthworks.co.za/
