#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 10 - Docker Setup"


timer_start



# ==========================================
# Docker Installation
# ==========================================

header "Docker Installation"


if command_exists docker; then

    success "Docker already installed"

else

    info "Installing Docker..."

    sudo apt update

    sudo apt install -y docker.io docker-compose-plugin

fi



docker --version



# ==========================================
# Docker Service
# ==========================================

header "Docker Service"


sudo systemctl enable docker

sudo systemctl start docker



if systemctl is-active --quiet docker; then

    success "Docker service running"

else

    error "Docker service failed"

    exit 1

fi



# ==========================================
# Docker Group
# ==========================================

header "Docker User Setup"


if groups "$USER" | grep -q docker; then

    success "User already in docker group"

else

    sudo usermod -aG docker "$USER"

    success "Added user to docker group"

    warning "Logout/Login required for docker group changes"

fi



# ==========================================
# Docker Compose
# ==========================================

header "Docker Compose"


if docker compose version >/dev/null 2>&1; then

    docker compose version

    success "Docker Compose available"

else

    error "Docker Compose not available"

fi



# ==========================================
# Docker Test
# ==========================================

header "Docker Verification"


if docker run hello-world >/dev/null 2>&1; then

    success "Docker is working correctly"

else

    warning "Run again after logout/login"

fi



timer_end


summary


success "Docker Setup Completed!"
