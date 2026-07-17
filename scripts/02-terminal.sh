#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 02 - Terminal Setup"


timer_start


# ==========================================
# Install Terminal Packages
# ==========================================

header "Installing Terminal Tools"


PACKAGES=(

    zsh

    eza

    bat

    fzf

    zoxide

)


for package in "${PACKAGES[@]}"
do

    install_package "$package"

done



# ==========================================
# Fix bat command
# ==========================================

if command_exists batcat && ! command_exists bat; then

    sudo ln -sf "$(which batcat)" /usr/local/bin/bat

    success "bat command configured"

fi



# ==========================================
# Oh My Zsh
# ==========================================

header "Oh My Zsh"


if [ ! -d "$HOME/.oh-my-zsh" ]; then


    info "Installing Oh My Zsh..."


    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


    success "Oh My Zsh installed"


else

    success "Oh My Zsh already installed"

fi



# ==========================================
# Powerlevel10k
# ==========================================

header "Powerlevel10k Theme"


P10K_DIR="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"


if [ ! -d "$P10K_DIR" ]; then


    git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    "$P10K_DIR"


    success "Powerlevel10k installed"


else

    success "Powerlevel10k already installed"

fi



# ==========================================
# Plugins
# ==========================================

header "Zsh Plugins"


PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"


if [ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ]; then


    git clone \
    https://github.com/zsh-users/zsh-autosuggestions \
    "$PLUGIN_DIR/zsh-autosuggestions"


fi


if [ ! -d "$PLUGIN_DIR/zsh-syntax-highlighting" ]; then


    git clone \
    https://github.com/zsh-users/zsh-syntax-highlighting \
    "$PLUGIN_DIR/zsh-syntax-highlighting"


fi


success "Zsh plugins ready"



# ==========================================
# Backup Zshrc
# ==========================================

header "Zsh Configuration"


ZSHRC="$HOME/.zshrc"


if [ -f "$ZSHRC" ] && [ ! -f "$ZSHRC.backup" ]; then

    cp "$ZSHRC" "$ZSHRC.backup"

    success "Zshrc backup created"

fi



# ==========================================
# Configure Zsh
# ==========================================

cat > "$ZSHRC" <<'EOF'

export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(
git
zsh-autosuggestions
zsh-syntax-highlighting
fzf
)


source $ZSH/oh-my-zsh.sh


# Aliases

alias ll="eza -la"
alias ls="eza"
alias cat="batcat"


# Better navigation

eval "$(zoxide init zsh)"


# History

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history


EOF


success "Zsh configuration updated"



# ==========================================
# Default Shell
# ==========================================

if [ "$SHELL" != "$(which zsh)" ]; then


    info "Changing default shell to zsh"


    chsh -s "$(which zsh)"


fi



timer_end


summary


success "Terminal Setup Completed!"
