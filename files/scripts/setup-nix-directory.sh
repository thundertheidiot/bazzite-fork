#!/usr/bin/env bash
set -oue pipefail

mkdir -p /nix
systemctl enable ostree-state-overlay@nix.service