#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

header "Phase 7 - Redis"

check_internet

install_package redis-server

if command_exists redis-server; then
    success "Redis already installed"
fi

sudo systemctl enable redis-server
sudo systemctl start redis-server

header "Verification"

redis-server --version

echo

redis-cli ping

echo

systemctl is-active redis-server

echo

success "Redis Installed Successfully!"
