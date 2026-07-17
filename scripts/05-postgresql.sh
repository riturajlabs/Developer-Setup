#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 05 - PostgreSQL Setup"


timer_start



# ==========================================
# PostgreSQL Installation
# ==========================================

header "PostgreSQL Installation"


if command_exists psql; then

    success "PostgreSQL already installed"

else

    info "Installing PostgreSQL..."

    sudo apt update

    sudo apt install -y postgresql postgresql-contrib

fi



# ==========================================
# Service Setup
# ==========================================

header "PostgreSQL Service"


sudo systemctl enable postgresql

sudo systemctl start postgresql


if systemctl is-active --quiet postgresql; then

    success "PostgreSQL service running"

else

    error "PostgreSQL service failed"

    exit 1

fi



# ==========================================
# Version Check
# ==========================================

header "PostgreSQL Version"


psql --version



# ==========================================
# PostgreSQL User
# ==========================================

header "Database User"


POSTGRES_USER="postgres"


if sudo -u postgres psql -tAc "SELECT 1 FROM pg_roles WHERE rolname='${POSTGRES_USER}'" | grep -q 1; then

    success "PostgreSQL user exists"

else

    sudo -u postgres createuser "$POSTGRES_USER"

fi



# ==========================================
# Connection Test
# ==========================================

header "Connection Test"


if sudo -u postgres psql -c "\conninfo" >/dev/null 2>&1; then

    success "PostgreSQL connection successful"

else

    error "PostgreSQL connection failed"

    exit 1

fi



# ==========================================
# Useful Extensions
# ==========================================

header "PostgreSQL Extensions"


sudo -u postgres psql <<EOF

CREATE EXTENSION IF NOT EXISTS pgcrypto;

EOF


success "Extensions configured"



timer_end


summary


success "PostgreSQL Setup Completed!"
