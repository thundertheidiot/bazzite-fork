#!/usr/bin/env bash
set -euo pipefail

# lix installer
curl -sSf -L https://install.lix.systems/lix | sh -s -- install linux --no-start-daemon --no-confirm

# setup service files, cross fs symlinks don't work
rm /etc/systemd/system/nix-daemon.service /etc/systemd/system/nix-daemon.socket
cp /nix/var/nix/profiles/default/lib/systemd/system/* /etc/systemd/system/
ln -sf /etc/systemd/system/nix-daemon.socket /etc/systemd/system/sockets.target.wants/nix-daemon.socket

# setup nix directory
mv /nix /etc/.tmp-nix
mkdir /nix
