#!/usr/bin/env bash

set -Eeuo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/utils.sh"


header "Phase 09 - AI/ML Environment Setup"


timer_start


# ==========================================
# Check AI Virtual Environment
# ==========================================

header "Checking AI Environment"


VENV_DIR="$HOME/.venvs/ai"


if [ ! -d "$VENV_DIR" ]; then

    error "AI virtual environment not found"

    echo "Run Phase 08 first"

    exit 1

fi


source "$VENV_DIR/bin/activate"


success "AI environment activated"



# ==========================================
# Upgrade Basic Tools
# ==========================================

header "Python Tools"


python -m pip install --upgrade pip setuptools wheel



# ==========================================
# Package Installer Function
# ==========================================

install_python_package() {

    PACKAGE="$1"

    if pip show "$PACKAGE" >/dev/null 2>&1; then

        success "$PACKAGE already installed"

    else

        info "Installing $PACKAGE..."

        pip install "$PACKAGE"

    fi

}



# ==========================================
# AI / ML Packages
# ==========================================

header "Installing AI Packages"


PACKAGES=(

    numpy

    pandas

    matplotlib

    scikit-learn


    torch

    torchvision


    opencv-python


    transformers

    sentence-transformers

    datasets


    langchain

    langgraph

    llama-index


    faiss-cpu

    chromadb


    fastapi

    uvicorn

    streamlit

)


for package in "${PACKAGES[@]}"
do

    install_python_package "$package"

done



# ==========================================
# Verification
# ==========================================

header "AI Package Verification"



python <<EOF

packages = {

"numpy":"numpy",

"pandas":"pandas",

"sklearn":"sklearn",

"torch":"torch",

"torchvision":"torchvision",

"opencv":"cv2",

"transformers":"transformers",

"sentence-transformers":"sentence_transformers",

"langchain":"langchain",

"langgraph":"langgraph",

"llama-index":"llama_index",

"faiss":"faiss",

"chromadb":"chromadb",

"fastapi":"fastapi",

"streamlit":"streamlit"

}


for name,module in packages.items():

    try:

        __import__(module)

        print(f"{name:25} ✅")

    except Exception as e:

        print(f"{name:25} ❌")


EOF



deactivate



timer_end


summary


success "AI Environment Setup Completed!"
