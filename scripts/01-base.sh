#!/bin/bash

#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 01 - Base System Setup"


timer_start


# ==========================================
# Root Check
# ==========================================

if [ "$EUID" -eq 0 ]; then

    error "Do not run this script as root."

    exit 1

fi


# ==========================================
# Internet Check
# ==========================================

check_internet



# ==========================================
# System Update
# ==========================================

header "System Update"


info "Updating package lists..."

sudo apt update


if [ "${UPDATE_SYSTEM:-false}" = "true" ]; then

    info "Upgrading system packages..."

    sudo apt upgrade -y

    success "System upgrade completed"

else

    info "Skipping system upgrade"

    info "Run with UPDATE_SYSTEM=true if required"

fi



# ==========================================
# Essential Packages
# ==========================================

header "Installing Essential Packages"


PACKAGES=(

    build-essential

    curl

    wget

    git

    unzip

    zip

    tar

    gzip

    ca-certificates

    gnupg

    lsb-release

    software-properties-common

    apt-transport-https

    openssh-client

    nano

    vim

    tree

    htop

    btop

    jq

    ripgrep

    fd-find

    tmux

    net-tools

    dnsutils

    rsync

)


for package in "${PACKAGES[@]}"
do

    install_package "$package"

done



# ==========================================
# fd command fix
# ==========================================

header "Command Configuration"


if command_exists fdfind && ! command_exists fd; then


    sudo ln -sf "$(which fdfind)" /usr/local/bin/fd


    success "fd command configured"


else

    success "fd command already available"

fi



# ==========================================
# Locale
# ==========================================

header "Locale Setup"


sudo locale-gen en_US.UTF-8 >/dev/null 2>&1 || true



# ==========================================
# Timezone
# ==========================================

header "Timezone Setup"


sudo timedatectl set-timezone Asia/Kolkata || true



# ==========================================
# Cleanup
# ==========================================

header "System Cleanup"


sudo apt autoremove -y

sudo apt autoclean



timer_end


summary


success "Base System Setup Completed!"
