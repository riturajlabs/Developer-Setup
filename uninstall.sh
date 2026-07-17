#!/usr/bin/env bash

set -Eeuo pipefail


BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


source "$BASE_DIR/scripts/utils.sh"



header "Developer Setup Uninstaller"



confirm(){

    read -p "$1 (y/N): " choice

    [[ "$choice" == "y" || "$choice" == "Y" ]]

}



# ==========================================
# Remove Dev Tools
# ==========================================

remove_tools(){

header "Removing Developer Tools"


if confirm "Remove GitHub CLI?"; then

    sudo apt remove gh -y

fi


if confirm "Remove HTTPie?"; then

    sudo apt remove httpie -y

fi


if command -v lazygit >/dev/null 2>&1; then

    if confirm "Remove lazygit?"; then

        sudo rm -f "$(which lazygit)"

    fi

fi


success "Developer tools cleanup completed"

}



# ==========================================
# Remove Node
# ==========================================

remove_node(){

header "Removing Node Environment"


if confirm "Remove Node.js and npm?"; then


    sudo apt remove nodejs npm -y


    sudo apt autoremove -y


    success "Node removed"

fi


}



# ==========================================
# Remove AI Environment
# ==========================================

remove_ai(){


header "Removing AI Environment"


if [ -d "$HOME/.venvs/ai" ]; then


    if confirm "Delete AI virtual environment?"; then


        rm -rf "$HOME/.venvs/ai"


        success "AI environment removed"


    fi


else

    warning "AI environment not found"

fi


}



# ==========================================
# Remove Databases
# ==========================================

remove_database(){


header "Removing Databases"



if confirm "Remove PostgreSQL?"; then

    sudo apt remove postgresql* -y

fi



if confirm "Remove MongoDB?"; then

    sudo apt remove mongodb-org* -y

fi



if confirm "Remove Redis?"; then

    sudo apt remove redis* -y

fi



success "Database cleanup completed"

}



# ==========================================
# Remove Docker
# ==========================================

remove_docker(){


header "Removing Docker"


if confirm "Remove Docker completely?"; then


sudo apt remove docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


sudo apt autoremove -y


success "Docker removed"


fi


}



# ==========================================
# Workspace
# ==========================================

remove_workspace(){


header "Workspace"


echo

echo "Developer workspace location:"

echo "$HOME/Developer"


echo


warning "Projects are NOT removed automatically"


if confirm "Remove empty workspace folders?"; then


    find "$HOME/Developer" -type d -empty -delete 2>/dev/null || true


    success "Empty folders removed"


fi


}



# ==========================================
# Full Cleanup
# ==========================================

full_cleanup(){


warning "This removes installed development components."

warning "Your projects will remain safe."


if confirm "Continue full cleanup?"; then


remove_tools

remove_node

remove_ai

remove_database

remove_docker

remove_workspace


success "Full cleanup completed"


fi


}



# ==========================================
# Menu
# ==========================================


while true

do


clear


echo "
=================================
 Developer Setup Uninstaller
=================================

1) Remove Developer Tools

2) Remove Node Environment

3) Remove Python AI Environment

4) Remove Databases

5) Remove Docker

6) Clean Workspace

7) Full Cleanup

0) Exit

=================================
"


read -p "Choose option: " OPTION



case $OPTION in


1)
remove_tools
;;


2)
remove_node
;;


3)
remove_ai
;;


4)
remove_database
;;


5)
remove_docker
;;


6)
remove_workspace
;;


7)
full_cleanup
;;


0)

success "Exit"

exit 0

;;


*)

warning "Invalid option"

;;


esac



read -p "Press Enter to continue..."

done
