#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/scripts/utils.sh"



header "Developer Environment Doctor"



timer_start



ISSUES=0



problem(){

    error "$1"

    ISSUES=$((ISSUES+1))

}



fixed(){

    success "$1"

}



suggest(){

    echo "   Fix: $1"

}



# ==========================================
# WSL Check
# ==========================================

header "System Check"



if grep -qi microsoft /proc/version; then

    fixed "WSL environment detected"

else

    fixed "Linux environment detected"

fi



# ==========================================
# PATH Check
# ==========================================

header "PATH Check"



if echo "$PATH" | grep -q "$HOME/.local/bin"; then

    fixed "~/.local/bin available in PATH"

else

    problem "~/.local/bin missing from PATH"

    suggest 'Add: export PATH="$HOME/.local/bin:$PATH"'

fi



# ==========================================
# Node Environment
# ==========================================

header "Node Environment"



NODE_TOOLS=(

node

npm

pnpm

bun

nodemon

)



for tool in "${NODE_TOOLS[@]}"
do

    if command -v "$tool" >/dev/null 2>&1; then

        fixed "$tool available"

    else

        problem "$tool missing"

    fi

done



# ==========================================
# Database Check
# ==========================================

header "Database"



if pg_isready >/dev/null 2>&1; then

    fixed "PostgreSQL healthy"

else

    problem "PostgreSQL not responding"

    suggest "sudo systemctl start postgresql"

fi



if mongosh --quiet --eval "db.runCommand({ping:1})" | grep -q ok; then

    fixed "MongoDB healthy"

else

    problem "MongoDB not responding"

fi



if redis-cli ping 2>/dev/null | grep -q PONG; then

    fixed "Redis healthy"

else

    problem "Redis not responding"

fi



# ==========================================
# Python AI
# ==========================================

header "Python AI"



if [ -d "$HOME/.venvs/ai" ]; then

    fixed "AI virtual environment exists"

else

    problem "AI virtual environment missing"

    suggest "./scripts/08-python.sh"

fi



PY_PACKAGES=(

torch

transformers

langchain

chromadb

faiss

)



if [ -d "$HOME/.venvs/ai" ]; then


source "$HOME/.venvs/ai/bin/activate"



for pkg in "${PY_PACKAGES[@]}"
do


python - <<EOF >/dev/null 2>&1
import $pkg
EOF


if [ $? -eq 0 ]; then

    fixed "Python package $pkg"

else

    problem "Python package missing: $pkg"

fi


done


deactivate


fi



# ==========================================
# Docker
# ==========================================

header "Docker"



if docker info >/dev/null 2>&1; then

    fixed "Docker daemon running"

else

    problem "Docker daemon unavailable"

    suggest "sudo systemctl start docker"

fi



# ==========================================
# VS Code
# ==========================================

header "Editor"



if command -v code >/dev/null 2>&1; then

    fixed "VS Code CLI available"

else

    problem "VS Code CLI missing"

fi



# ==========================================
# Summary
# ==========================================


timer_end


header "Doctor Report"



echo

echo "Issues Found : $ISSUES"

echo



if [ "$ISSUES" -eq 0 ]; then


    success "Your developer environment is healthy 🚀"


else


    warning "Some issues need attention"

fi
