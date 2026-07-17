#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/utils.sh"

header "Phase 6 - MongoDB 8.0"

check_internet

install_package wget
install_package gnupg
install_package ca-certificates

KEYRING="/usr/share/keyrings/mongodb-server-8.0.gpg"
REPO_FILE="/etc/apt/sources.list.d/mongodb-org-8.0.list"

# ==========================================
# MongoDB Repository
# ==========================================

if [ ! -f "$KEYRING" ]; then

    info "Downloading MongoDB GPG Key..."

    wget -qO /tmp/server-8.0.asc https://pgp.mongodb.com/server-8.0.asc

    gpg --dearmor /tmp/server-8.0.asc

    sudo mkdir -p /usr/share/keyrings

    sudo mv /tmp/server-8.0.asc.gpg "$KEYRING"

    rm -f /tmp/server-8.0.asc

    success "MongoDB GPG Key Added"

else

    success "MongoDB GPG Key already exists"

fi


if [ ! -f "$REPO_FILE" ]; then

    info "Adding MongoDB Repository..."

    echo "deb [arch=amd64 signed-by=$KEYRING] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" \
    | sudo tee "$REPO_FILE" >/dev/null

    success "Repository Added"

else

    success "Repository already exists"

fi


sudo apt update


# ==========================================
# Install MongoDB
# ==========================================

if command_exists mongod; then

    success "MongoDB already installed"

else

    info "Installing MongoDB..."

    sudo apt install -y mongodb-org

fi


# ==========================================
# Enable Service
# ==========================================

sudo systemctl enable mongod
sudo systemctl start mongod


# ==========================================
# Verification
# ==========================================

header "Verification"

mongod --version | head -n 2

echo

mongosh --version

echo

systemctl is-active mongod

echo

success "MongoDB 8.0 Installed Successfully!"
