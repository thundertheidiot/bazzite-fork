#!/usr/bin/env bash
set -oue pipefail

mkdir -p /etc/systemd/system/local-fs.target.wants
ln -sf /etc/systemd/system/nix.mount /etc/systemd/system/local-fs.target.wants/nix.mount