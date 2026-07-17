#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 11 - VS Code Setup"


timer_start



# ==========================================
# VS Code Check
# ==========================================

header "VS Code Verification"


if command_exists code; then

    success "VS Code CLI available"

    code --version | head -n 1

else

    warning "VS Code CLI not found"

    echo ""
    echo "Install VS Code on Windows and enable:"
    echo "Shell Command: Install 'code' command"
    echo ""

fi



# ==========================================
# VS Code Extensions
# ==========================================

header "VS Code Extensions"



EXTENSIONS=(

    ms-vscode-remote.remote-wsl

    ms-python.python

    ms-python.vscode-pylance

    ms-toolsai.jupyter

    eamodio.gitlens

    github.copilot

    github.copilot-chat

    esbenp.prettier-vscode

    dbaeumer.vscode-eslint

    bradlc.vscode-tailwindcss

)



if command_exists code; then


    for extension in "${EXTENSIONS[@]}"
    do

        if code --list-extensions | grep -qi "$extension"; then

            success "$extension already installed"

        else

            info "Installing $extension"

            code --install-extension "$extension" --force

        fi

    done


else

    warning "Skipping extensions because VS Code CLI unavailable"

fi



# ==========================================
# WSL Check
# ==========================================

header "WSL Integration"


if command_exists code; then

    success "VS Code WSL integration ready"

else

    warning "Install VS Code WSL extension manually"

fi



# ==========================================
# Workspace Folder
# ==========================================

header "VS Code Workspace"


WORKSPACE="$HOME/Developer"


if [ ! -d "$WORKSPACE" ]; then

    mkdir -p "$WORKSPACE"

    success "Developer workspace created"

else

    success "Developer workspace already exists"

fi



timer_end


summary


success "VS Code Setup Completed!"
