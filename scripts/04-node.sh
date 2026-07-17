#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 04 - Node.js Development Setup"


timer_start



# ==========================================
# Node.js Installation
# ==========================================

header "Node.js"


if command_exists node; then

    success "Node.js already installed"

else

    info "Installing Node.js..."

    curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -

    sudo apt install -y nodejs

fi


node --version

npm --version



# ==========================================
# Corepack
# ==========================================

header "Package Managers"


if command_exists corepack; then

    success "Corepack available"

else

    npm install -g corepack

fi


sudo corepack enable



# ==========================================
# pnpm
# ==========================================


if command_exists pnpm; then

    success "pnpm already installed"

else

    corepack prepare pnpm@latest --activate

fi


pnpm --version



# ==========================================
# Bun
# ==========================================

header "Bun Runtime"


if command_exists bun; then

    success "Bun already installed"

else

    info "Installing Bun..."

    curl -fsSL https://bun.sh/install | bash

fi


# Bun PATH refresh

export PATH="$HOME/.bun/bin:$PATH"


bun --version || warning "Restart terminal for Bun"



# ==========================================
# Nodemon
# ==========================================

header "Global Development Tools"


if command_exists nodemon; then

    success "Nodemon already installed"

else

    sudo npm install -g nodemon
    export PATH="/usr/bin:$PATH"

fi


nodemon --version



# ==========================================
# Verification
# ==========================================

header "Node Environment Verification"


echo

echo "Node:"
node -v

echo

echo "npm:"
npm -v

echo

echo "pnpm:"
pnpm -v

echo

echo "Bun:"
bun --version


echo

echo "Nodemon:"
nodemon --version



timer_end


summary


success "Node.js Setup Completed!"
