#!/usr/bin/env bash

set -Eeuo pipefail


BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SCRIPT_DIR="$BASE_DIR/scripts"


source "$SCRIPT_DIR/utils.sh"



header "Developer Setup Update"



timer_start



# ==========================================
# System Update
# ==========================================

header "System Packages"



info "Updating Ubuntu packages..."


sudo apt update


sudo apt upgrade -y


success "System packages updated"


# ==========================================
# Node Ecosystem
# ==========================================

header "Node Environment"


if command -v npm >/dev/null 2>&1; then

    info "Updating npm global packages"

    sudo npm update -g || warning "npm global update skipped"

    success "npm packages checked"

else

    warning "npm not found"

fi



if command -v corepack >/dev/null 2>&1; then

    info "Updating pnpm through corepack"

    corepack prepare pnpm@latest --activate || warning "pnpm update skipped"

fi


# ==========================================
# Python AI Environment
# ==========================================

header "Python AI Environment"



AI_ENV="$HOME/.venvs/ai"



if [ -d "$AI_ENV" ]; then


    source "$AI_ENV/bin/activate"


    info "Updating Python packages"


    pip install --upgrade pip setuptools wheel


    pip list --outdated


    deactivate


    success "Python environment checked"


else


    warning "AI environment not found"


fi



# ==========================================
# Docker Cleanup
# ==========================================

header "Docker Maintenance"



if command -v docker >/dev/null 2>&1; then


    info "Removing unused Docker data"


    docker system prune -f


    success "Docker cleanup completed"


else


    warning "Docker not installed"


fi



# ==========================================
# Developer Scripts Update
# ==========================================

header "Installer Files"



if [ -d "$BASE_DIR/.git" ]; then


    info "Checking repository updates"


    git pull || warning "Git update skipped"


else


    warning "Not a git repository"

fi



# ==========================================
# Cleanup
# ==========================================

header "Cleanup"



sudo apt autoremove -y

sudo apt autoclean



timer_end



header "Update Summary"



success "Developer Setup Updated Successfully 🚀"
