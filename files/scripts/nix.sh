#!/usr/bin/env bash

set -euo pipefail

systemctl enable ostree-state-overlay@nix.service
