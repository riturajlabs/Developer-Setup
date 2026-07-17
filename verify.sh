#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/scripts/utils.sh"



header "Developer Environment Verification"



timer_start


PASS=0
FAIL=0



pass(){

    success "$1"

    PASS=$((PASS+1))

}



fail(){

    error "$1"

    FAIL=$((FAIL+1))

}



info_check(){

    echo

    echo "$1"

}



# ==========================================
# Command Checker
# ==========================================

check_command(){

    NAME="$1"
    CMD="$2"


    if command -v "$CMD" >/dev/null 2>&1; then

        VERSION=$($CMD --version 2>/dev/null | head -n 1 || true)

        pass "$NAME : $VERSION"

    else

        fail "$NAME missing"

    fi

}



# ==========================================
# System
# ==========================================

header "System"


check_command "Git" git

check_command "Zsh" zsh

check_command "Curl" curl

check_command "Wget" wget

check_command "Tree" tree



# ==========================================
# Node Ecosystem
# ==========================================

header "Node Development"


check_command "Node.js" node

check_command "npm" npm

check_command "pnpm" pnpm

check_command "Bun" bun

check_command "TypeScript" tsc

check_command "ESLint" eslint

check_command "Prettier" prettier

check_command "Nodemon" nodemon



# ==========================================
# Databases
# ==========================================

header "Database Verification"



# PostgreSQL

if command -v psql >/dev/null 2>&1; then


    if pg_isready >/dev/null 2>&1; then

        pass "PostgreSQL connection"

    else

        fail "PostgreSQL connection failed"

    fi


else

    fail "PostgreSQL missing"

fi



# MongoDB

if command -v mongosh >/dev/null 2>&1; then


    if mongosh --quiet --eval "db.runCommand({ping:1})" | grep -q "ok"; then

        pass "MongoDB connection"

    else

        fail "MongoDB connection failed"

    fi


else

    fail "MongoDB shell missing"

fi



# Redis

if command -v redis-cli >/dev/null 2>&1; then


    if redis-cli ping | grep -q "PONG"; then

        pass "Redis connection"

    else

        fail "Redis connection failed"

    fi


else

    fail "Redis missing"

fi



# ==========================================
# Python AI Environment
# ==========================================

header "Python AI Environment"



check_command "Python3" python3


if command -v uv >/dev/null 2>&1; then

    pass "uv : $(uv --version)"

elif [ -f "$HOME/.local/bin/uv" ]; then

    pass "uv : $($HOME/.local/bin/uv --version)"

else

    fail "uv missing"

fi



AI_ENV="$HOME/.venvs/ai"


if [ -d "$AI_ENV" ]; then

    pass "AI Virtual Environment"

else

    fail "AI Virtual Environment missing"

fi



if [ -d "$AI_ENV" ]; then


source "$AI_ENV/bin/activate"



PY_PACKAGES=(

numpy

pandas

sklearn

torch

torchvision

cv2

transformers

sentence_transformers

langchain

langgraph

llama_index

faiss

chromadb

fastapi

streamlit

)



for pkg in "${PY_PACKAGES[@]}"
do


python - <<EOF >/dev/null 2>&1
import $pkg
EOF


if [ $? -eq 0 ]; then

    pass "Python package : $pkg"

else

    fail "Python package missing : $pkg"

fi


done



deactivate


fi



# ==========================================
# Docker
# ==========================================

header "Docker"



check_command "Docker" docker



if docker compose version >/dev/null 2>&1; then

    pass "Docker Compose"

else

    fail "Docker Compose missing"

fi



if docker run --rm hello-world >/dev/null 2>&1; then

    pass "Docker container test"

else

    fail "Docker container test failed"

fi



# ==========================================
# VS Code
# ==========================================

header "Editor"


check_command "VS Code" code



# ==========================================
# Workspace
# ==========================================

header "Workspace"



if [ -d "$HOME/Developer" ]; then

    pass "Developer Workspace"

else

    fail "Developer Workspace missing"

fi



# ==========================================
# Summary
# ==========================================


timer_end


header "Verification Summary"


echo

echo "Passed : $PASS"

echo "Failed : $FAIL"

echo



if [ "$FAIL" -eq 0 ]; then


    success "ALL SYSTEMS READY 🚀"


else


    warning "Some components need attention"


fi
