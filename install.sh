#!/usr/bin/env bash

set -Eeuo pipefail


BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SCRIPTS_DIR="$BASE_DIR/scripts"



source "$SCRIPTS_DIR/utils.sh"



header "Developer Setup Installer"



# ==========================================
# Run Script Helper
# ==========================================

run_phase(){

    SCRIPT="$1"

    NAME="$2"


    echo

    header "$NAME"


    if [ -f "$SCRIPTS_DIR/$SCRIPT" ]; then


        chmod +x "$SCRIPTS_DIR/$SCRIPT"


        "$SCRIPTS_DIR/$SCRIPT"


    else


        error "$SCRIPT not found"


    fi

}



# ==========================================
# Full Setup
# ==========================================

full_install(){


run_phase "01-base.sh" "Base System"
run_phase "02-terminal.sh" "Terminal Setup"
run_phase "03-git.sh" "Git Setup"
run_phase "04-node.sh" "Node Development"
run_phase "05-postgresql.sh" "PostgreSQL"
run_phase "06-mongodb.sh" "MongoDB"
run_phase "07-redis.sh" "Redis"
run_phase "08-python.sh" "Python"
run_phase "09-ai.sh" "AI/ML"
run_phase "10-docker.sh" "Docker"
run_phase "11-vscode.sh" "VS Code"
run_phase "12-devtools.sh" "Developer Tools"
run_phase "13-workspace.sh" "Workspace"



success "Complete Developer Setup Finished"

}



# ==========================================
# Web Development
# ==========================================

web_setup(){


run_phase "01-base.sh" "Base System"

run_phase "03-git.sh" "Git"

run_phase "04-node.sh" "Node.js"

run_phase "05-postgresql.sh" "PostgreSQL"

run_phase "06-mongodb.sh" "MongoDB"

run_phase "10-docker.sh" "Docker"

run_phase "11-vscode.sh" "VS Code"

run_phase "13-workspace.sh" "Workspace"


}



# ==========================================
# AI Setup
# ==========================================

ai_setup(){


run_phase "01-base.sh" "Base System"

run_phase "03-git.sh" "Git"

run_phase "08-python.sh" "Python"

run_phase "09-ai.sh" "AI Environment"

run_phase "10-docker.sh" "Docker"

run_phase "11-vscode.sh" "VS Code"


}



# ==========================================
# Database Setup
# ==========================================

database_setup(){


run_phase "05-postgresql.sh" "PostgreSQL"

run_phase "06-mongodb.sh" "MongoDB"

run_phase "07-redis.sh" "Redis"


}



# ==========================================
# DevOps Setup
# ==========================================

devops_setup(){


run_phase "10-docker.sh" "Docker"

run_phase "12-devtools.sh" "Developer Tools"


}



# ==========================================
# Custom Setup
# ==========================================

custom_setup(){


echo

echo "Available phases:"
echo

echo "1) Base System"
echo "2) Terminal"
echo "3) Git"
echo "4) Node"
echo "5) PostgreSQL"
echo "6) MongoDB"
echo "7) Redis"
echo "8) Python"
echo "9) AI"
echo "10) Docker"
echo "11) VS Code"
echo "12) DevTools"
echo "13) Workspace"

echo

read -p "Enter phase numbers (example: 1 3 4 10): " choices



for choice in $choices
do

case $choice in


1) run_phase "01-base.sh" "Base System" ;;

2) run_phase "02-terminal.sh" "Terminal" ;;

3) run_phase "03-git.sh" "Git" ;;

4) run_phase "04-node.sh" "Node" ;;

5) run_phase "05-postgresql.sh" "PostgreSQL" ;;

6) run_phase "06-mongodb.sh" "MongoDB" ;;

7) run_phase "07-redis.sh" "Redis" ;;

8) run_phase "08-python.sh" "Python" ;;

9) run_phase "09-ai.sh" "AI" ;;

10) run_phase "10-docker.sh" "Docker" ;;

11) run_phase "11-vscode.sh" "VS Code" ;;

12) run_phase "12-devtools.sh" "DevTools" ;;

13) run_phase "13-workspace.sh" "Workspace" ;;


*) warning "Invalid option $choice" ;;


esac


done


}



# ==========================================
# Menu
# ==========================================

while true

do


clear


echo "
=========================================
 Developer Setup Installer
=========================================

1) Full Developer Setup
2) Custom Setup
3) Web Development Setup
4) AI / ML Setup
5) Database Setup
6) DevOps Setup
7) Verify Installation
8) Doctor
9) Update Installer
0) Exit

=========================================
"


read -p "Choose an option: " OPTION



case $OPTION in


1)
full_install
;;


2)
custom_setup
;;


3)
web_setup
;;


4)
ai_setup
;;


5)
database_setup
;;


6)
devops_setup
;;


7)
"$BASE_DIR/verify.sh"
;;


8)
"$BASE_DIR/doctor.sh"
;;


9)
"$BASE_DIR/update.sh"
;;


0)

success "Goodbye 🚀"

exit 0

;;


*)

warning "Invalid option"

;;


esac



echo

read -p "Press Enter to continue..."

done
