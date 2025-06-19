#!/usr/bin/env bash
set -euo pipefail

. /etc/os-release

if [ $VARIANT_ID = "bazzite" ]; then
    file=/usr/libexec/bazzite-flatpak-manager
else
    file=/usr/libexec/ublue-flatpak-manager
fi

sed -i 's/org.mozilla.firefox/app.zen_browser.zen/g' "$file"
