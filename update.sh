#!/bin/bash
# Bump PKGBUILD to the newest upstream tag, regenerate .SRCINFO, and test-build.
set -euo pipefail
cd "$(dirname "$0")"

# shellcheck source=PKGBUILD
. ./PKGBUILD

latest=$pkgver
for tag in $(timeout 60 git ls-remote --tags --refs "$url" | sed -n 's|.*refs/tags/v||p'); do
  if (( $(vercmp "$tag" "$latest") > 0 )); then
    latest=$tag
  fi
done

if [[ $latest == "$pkgver" ]]; then
  echo "up to date: $pkgver"
  exit
fi

echo "$pkgver -> $latest"
sed -i -e "s/^pkgver=.*/pkgver=$latest/" -e 's/^pkgrel=.*/pkgrel=1/' PKGBUILD
timeout 300 updpkgsums
makepkg --printsrcinfo > .SRCINFO
makepkg -f
