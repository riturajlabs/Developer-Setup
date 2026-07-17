#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 03 - Git & GitHub Setup"


timer_start


# ==========================================
# Install Git
# ==========================================

header "Git Installation"


install_package git


git --version



# ==========================================
# Git Configuration
# ==========================================

header "Git Configuration"


read -rp "Enter Git username: " GIT_USERNAME

read -rp "Enter Git email: " GIT_EMAIL


git config --global user.name "$GIT_USERNAME"

git config --global user.email "$GIT_EMAIL"


git config --global init.defaultBranch main

git config --global core.editor "code --wait"

git config --global core.autocrlf input

git config --global color.ui auto

git config --global pull.rebase false

git config --global fetch.prune true

git config --global push.autoSetupRemote true


success "Git configuration completed"



# ==========================================
# Git Aliases
# ==========================================

header "Git Aliases"


git config --global alias.st "status"

git config --global alias.co "checkout"

git config --global alias.br "branch"

git config --global alias.cm "commit"

git config --global alias.last "log -1 HEAD"

git config --global alias.graph \
"log --all --graph --decorate --oneline"


success "Git aliases configured"



# ==========================================
# SSH Key
# ==========================================

header "GitHub SSH Setup"


SSH_KEY="$HOME/.ssh/id_ed25519"


mkdir -p "$HOME/.ssh"

chmod 700 "$HOME/.ssh"


if [ -f "$SSH_KEY" ]; then


    success "SSH key already exists"


else


    info "Generating SSH key..."


    ssh-keygen \
    -t ed25519 \
    -C "$GIT_EMAIL" \
    -f "$SSH_KEY" \
    -N ""


    success "SSH key generated"

fi



chmod 600 "$SSH_KEY"

chmod 644 "${SSH_KEY}.pub"



# ==========================================
# SSH Agent
# ==========================================

eval "$(ssh-agent -s)" >/dev/null


ssh-add "$SSH_KEY" >/dev/null 2>&1 || true



# ==========================================
# Display Public Key
# ==========================================

header "Public SSH Key"


cat "${SSH_KEY}.pub"



# ==========================================
# Git Config Verification
# ==========================================

header "Git Configuration Verification"


git config --global --list



timer_end


summary


success "Git Setup Completed!"
