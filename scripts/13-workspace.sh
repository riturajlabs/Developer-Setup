#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 13 - Developer Workspace Setup"


timer_start



# ==========================================
# Workspace Root
# ==========================================

header "Creating Developer Workspace"


DEV_DIR="$HOME/Developer"


DIRECTORIES=(

    Projects

    Projects/FullStack

    Projects/AI-ML

    Projects/DataScience

    Projects/Experiments


    Learning

    Learning/Notes

    Learning/Courses

    Learning/Practice


    Workspace


    Scripts


    Temp

)



for dir in "${DIRECTORIES[@]}"
do

    FULL_PATH="$DEV_DIR/$dir"


    if [ -d "$FULL_PATH" ]; then

        success "$dir already exists"

    else

        mkdir -p "$FULL_PATH"

        success "Created $dir"

    fi

done



# ==========================================
# Git Directory Setup
# ==========================================

header "Git Configuration"


GITIGNORE="$DEV_DIR/.gitignore"


if [ ! -f "$GITIGNORE" ]; then


cat > "$GITIGNORE" <<EOF

# Dependencies
node_modules/

# Python
__pycache__/
*.pyc
.venv/

# Environment
.env
.env.*

# Build
dist/
build/

# Logs
logs/

# OS
.DS_Store

EOF


success "Developer .gitignore created"


else

success ".gitignore already exists"

fi



# ==========================================
# Project Templates
# ==========================================

header "Creating Project Templates"


TEMPLATES=(

    node-app

    python-ai

    ml-notebook

)



for template in "${TEMPLATES[@]}"
do

    TEMPLATE_PATH="$DEV_DIR/Projects/Experiments/$template"


    if [ ! -d "$TEMPLATE_PATH" ]; then

        mkdir -p "$TEMPLATE_PATH"

        success "Created template: $template"

    else

        success "Template exists: $template"

    fi

done



# ==========================================
# Useful Aliases
# ==========================================

header "Developer Aliases"


ZSHRC="$HOME/.zshrc"


ALIASES='

alias dev="cd ~/Developer"

alias projects="cd ~/Developer/Projects"

alias ai="cd ~/Developer/Projects/AI-ML"

alias fullstack="cd ~/Developer/Projects/FullStack"

alias learning="cd ~/Developer/Learning"

'


if ! grep -q "alias dev=" "$ZSHRC"; then


    echo "$ALIASES" >> "$ZSHRC"


    success "Developer aliases added"


else

    success "Aliases already exist"

fi



# ==========================================
# Verification
# ==========================================

header "Workspace Verification"


tree -L 3 "$DEV_DIR"



timer_end


summary


success "Developer Workspace Setup Completed!"
