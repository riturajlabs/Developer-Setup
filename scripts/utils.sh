#!/usr/bin/env bash

# ==========================================================
# Developer-Setup Utility Library
# Version : 1.0.0
# ==========================================================

set -Eeuo pipefail

# -----------------------------
# Colors
# -----------------------------

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
MAGENTA="\033[0;35m"
BOLD="\033[1m"
RESET="\033[0m"

# -----------------------------
# Project Paths
# -----------------------------

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

LOG_DIR="$PROJECT_ROOT/logs"

mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/$(date +%F).log"

# -----------------------------
# Logging
# -----------------------------

log() {

    local LEVEL="$1"
    shift

    echo "[$(date '+%F %T')] [$LEVEL] $*" >> "$LOG_FILE"

}

# -----------------------------
# Pretty Messages
# -----------------------------

header() {

    echo
    echo -e "${MAGENTA}=================================================${RESET}"
    echo -e "${BOLD}$1${RESET}"
    echo -e "${MAGENTA}=================================================${RESET}"
    echo

    log INFO "$1"

}

info() {

    echo -e "${BLUE}[INFO]${RESET} $*"

    log INFO "$*"

}

success() {

    echo -e "${GREEN}[SUCCESS]${RESET} $*"

    log SUCCESS "$*"

}

warning() {

    echo -e "${YELLOW}[WARNING]${RESET} $*"

    log WARNING "$*"

}

error() {

    echo -e "${RED}[ERROR]${RESET} $*"

    log ERROR "$*"

}

# -----------------------------
# Command Check
# -----------------------------

command_exists() {

    command -v "$1" >/dev/null 2>&1

}

# -----------------------------
# Internet Check
# -----------------------------

check_internet() {

    if ping -c 1 google.com >/dev/null 2>&1; then

        success "Internet Connection Available"

    else

        error "No Internet Connection"

        exit 1

    fi

}

# -----------------------------
# Package Installer
# -----------------------------

install_package() {

    local PACKAGE="$1"

    if dpkg -s "$PACKAGE" >/dev/null 2>&1; then

        success "$PACKAGE is already installed"

    else

        info "Installing $PACKAGE..."

        sudo apt install -y "$PACKAGE"

    fi

}

# -----------------------------
# Retry Function
# -----------------------------

retry() {

    local MAX=3

    local COUNT=1

    until "$@"
    do

        if (( COUNT >= MAX ))
        then

            error "Command failed after $MAX attempts."

            return 1

        fi

        warning "Retry $COUNT/$MAX..."

        COUNT=$((COUNT+1))

        sleep 2

    done

}

# -----------------------------
# Download Helper
# -----------------------------

download_file() {

    local URL="$1"

    local OUTPUT="$2"

    retry wget -q --show-progress "$URL" -O "$OUTPUT"

}

# -----------------------------
# Timer
# -----------------------------

timer_start() {

    TIMER_START=$(date +%s)

}

timer_end() {

    local END

    END=$(date +%s)

    local ELAPSED=$((END-TIMER_START))

    success "Completed in ${ELAPSED} seconds."

}

# -----------------------------
# Confirm
# -----------------------------

confirm() {

    read -rp "$1 [y/N]: " ANSWER

    [[ "$ANSWER" =~ ^[Yy]$ ]]

}

# -----------------------------
# Backup
# -----------------------------

backup_file() {

    local FILE="$1"

    if [ -f "$FILE" ]; then

        cp "$FILE" "${FILE}.bak"

        success "Backup created: ${FILE}.bak"

    fi

}

# -----------------------------
# Run Command
# -----------------------------

run() {

    info "$*"

    "$@"

}

# -----------------------------
# Cleanup
# -----------------------------

cleanup() {

    success "Cleaning temporary files..."

    rm -rf /tmp/devsetup-* 2>/dev/null || true

}

trap cleanup EXIT

# -----------------------------
# Summary
# -----------------------------

summary() {

    echo
    echo -e "${CYAN}=========================================${RESET}"
    echo -e "${BOLD}Developer Setup Completed${RESET}"
    echo -e "${CYAN}=========================================${RESET}"
    echo
    echo "Log File:"
    echo "$LOG_FILE"
    echo

}
