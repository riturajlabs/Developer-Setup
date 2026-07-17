#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 12 - Developer Tools Setup"


timer_start



# ==========================================
# Helper Function
# ==========================================

install_tool() {

    TOOL="$1"

    if command_exists "$TOOL"; then

        success "$TOOL already installed"

    else

        info "Installing $TOOL..."

        sudo apt install -y "$TOOL"

    fi

}



# ==========================================
# APT Tools
# ==========================================

header "CLI Development Tools"


PACKAGES=(

    httpie

    yq

)


for package in "${PACKAGES[@]}"
do

    install_tool "$package"

done



# ==========================================
# GitHub CLI
# ==========================================

header "GitHub CLI"


if command_exists gh; then

    success "GitHub CLI already installed"

else

    info "Installing GitHub CLI..."


    sudo apt update

    sudo apt install -y gh


fi


gh --version | head -n 1



# ==========================================
# Lazygit
# ==========================================

header "Lazygit"


if command_exists lazygit; then

    success "lazygit already installed"

else

    info "Installing lazygit"


    LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest \
    | grep '"tag_name"' \
    | cut -d '"' -f 4)


    curl -Lo lazygit.tar.gz \
    "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION#v}_Linux_x86_64.tar.gz"


    tar xf lazygit.tar.gz lazygit


    sudo install lazygit /usr/local/bin


    rm lazygit lazygit.tar.gz


fi


lazygit --version



# ==========================================
# Developer Verification
# ==========================================

header "Developer Tools Verification"


echo

echo "GitHub CLI:"
gh --version | head -n 1


echo

echo "HTTPie:"
http --version


echo

echo "YQ:"
yq --version


echo

echo "Lazygit:"
lazygit --version



timer_end


summary


success "Developer Tools Setup Completed!"
