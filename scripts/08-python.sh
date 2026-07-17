#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 08 - Python Development Setup"


timer_start



# ==========================================
# Python Installation
# ==========================================

header "Python Installation"


PACKAGES=(

    python3

    python3-pip

    python3-venv

    pipx

)


for package in "${PACKAGES[@]}"
do

    install_package "$package"

done



python3 --version

pip3 --version



# ==========================================
# pipx Setup
# ==========================================

header "pipx Configuration"


pipx ensurepath || true


success "pipx configured"



# ==========================================
# uv Installation
# ==========================================

header "uv Python Manager"


if command_exists uv; then

    success "uv already installed"

else

    curl -LsSf https://astral.sh/uv/install.sh | sh

    export PATH="$HOME/.local/bin:$PATH"

fi


uv --version



# ==========================================
# AI Virtual Environment
# ==========================================

header "Python Virtual Environment"


VENV_DIR="$HOME/.venvs/ai"


if [ -d "$VENV_DIR" ]; then

    success "AI virtual environment already exists"

else

    mkdir -p "$HOME/.venvs"


    python3 -m venv "$VENV_DIR"


    success "AI virtual environment created"

fi



# ==========================================
# Upgrade pip
# ==========================================

source "$VENV_DIR/bin/activate"


python -m pip install --upgrade pip setuptools wheel


deactivate



# ==========================================
# Development Packages
# ==========================================

header "Python Development Tools"


source "$VENV_DIR/bin/activate"


pip install \
ipython \
jupyterlab


deactivate



# ==========================================
# Verification
# ==========================================

header "Python Verification"


echo

python3 --version

echo

uv --version

echo

source "$VENV_DIR/bin/activate"

python --version

pip list


deactivate



timer_end


summary


success "Python Setup Completed!"
