#!/usr/bin/env bash
set -euo pipefail

# lix installer
curl -sSf -L https://install.lix.systems/lix | sh -s -- install linux --no-start-daemon --no-confirm

# setup service files, cross fs symlinks don't work
rm /etc/systemd/system/nix-daemon.service /etc/systemd/system/nix-daemon.socket
cp /nix/var/nix/profiles/default/lib/systemd/system/* /etc/systemd/system/
ln -sf /etc/systemd/system/nix-daemon.socket /etc/systemd/system/sockets.target.wants/nix-daemon.socket

# This cannot be done as a system file, the lix installer fails otherwise.
mkdir -p /etc/systemd/system/nix-daemon.socket.d
cat <<EOF > /etc/systemd/system/nix-daemon.socket.d/override.conf
[Unit]
After=nix.mount
BindsTo=nix.mount
EOF


# setup nix directory
mv /nix /etc/.tmp-nix
mkdir /nix
