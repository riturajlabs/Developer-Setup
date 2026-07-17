# ⚙️ Customization Guide

## Developer Setup Automation Toolkit


This guide explains how to customize and extend the **Developer Setup Automation Toolkit** according to your development requirements.


The toolkit is designed with a modular architecture, allowing developers to easily add new technologies, modify existing configurations, and create custom installation workflows.


---

# 🧩 Customization Philosophy


The toolkit follows these principles:


```
Customize

    ↓

Add Module

    ↓

Configure

    ↓

Test

    ↓

Integrate

```


You can customize:


- Installation scripts
- Package lists
- Development tools
- AI libraries
- Workspace structure
- Environment settings


---

# 📂 Configuration System


All configuration files are stored inside:


```
config/
```


Structure:


```
config/

├── packages.conf

├── node-tools.conf

├── ai-packages.conf

└── settings.conf

```


---

# 📦 System Packages


File:


```
config/packages.conf
```


Used for installing Ubuntu packages.


Example:


```bash
curl

wget

git

tree

htop

tmux

```


To add a new package:


Example:


```bash
neofetch

```


Add it inside:


```
packages.conf
```


The installer will automatically include it during setup.


---

# 🌐 Node.js Tools


File:


```
config/node-tools.conf
```


Stores Node ecosystem tools.


Example:


```text
pnpm

bun

nodemon

```


Add additional tools:


```text
typescript

eslint

prettier

```


---

# 🤖 AI / ML Packages


File:


```
config/ai-packages.conf
```


Stores Python AI dependencies.


Example:


```text
torch

transformers

langchain

faiss

chromadb

```


Add new AI libraries:


Example:


```text
tensorflow

keras

opencv-python

```


The AI environment installer will install them automatically.


---

# ⚙️ Environment Settings


File:


```
config/settings.conf
```


Stores global configuration.


Example:


```bash
WORKSPACE_DIR=~/Developer

PYTHON_ENV=venv

DEFAULT_SHELL=zsh

```


You can modify:


- Workspace location
- Default environment name
- Installation preferences


---

# ➕ Adding New Installation Scripts


The toolkit uses numbered scripts.


Example:


```
scripts/

01-base.sh

02-terminal.sh

03-git.sh

...

```


To add a new technology:


Create a new script:


Example:


```
scripts/14-java.sh
```


---

# ☕ Example: Adding Java Setup


Create:


```
scripts/14-java.sh
```


Add:


```bash
#!/bin/bash


echo "Installing Java..."


sudo apt update

sudo apt install openjdk-21-jdk -y


java -version


echo "Java installation completed"

```


Make executable:


```bash
chmod +x scripts/14-java.sh
```


---

# 🦀 Example: Adding Rust Setup


Create:


```
scripts/15-rust.sh
```


Example:


```bash
#!/bin/bash


echo "Installing Rust..."


curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh


rustc --version

```


---

# ☸️ Example: Adding Kubernetes


Create:


```
scripts/16-kubernetes.sh
```


Possible tools:


```text
kubectl

minikube

helm

```


---

# 🔗 Integrating New Scripts


After creating a script:


Update:


```
install.sh
```


Add the new module:


Example:


```bash
bash scripts/14-java.sh
```


Now the installer can execute your new setup phase.


---

# 🏗 Creating Custom Installation Profiles


You can create custom developer profiles.


Example:


## Full Stack Developer Profile


```text
Node.js

MongoDB

PostgreSQL

Redis

Docker

VS Code

```


---

## AI Engineer Profile


```text
Python

PyTorch

Transformers

LangChain

FAISS

Jupyter

```


---

## DevOps Engineer Profile


```text
Docker

Docker Compose

Kubernetes

Terraform

Cloud CLI

```


---

# 📁 Custom Workspace


Default workspace:


```
~/Developer
```


Structure:


```
Developer/

├── Projects

├── FullStack

├── AI-ML

├── DataScience

├── Experiments

├── Learning

└── Scripts

```


To change location:


Edit:


```
config/settings.conf
```


Example:


```bash
WORKSPACE_DIR=~/Projects
```


---

# 🎨 Terminal Customization


Terminal configuration is handled by:


```
scripts/02-terminal.sh
```


You can customize:


- Zsh plugins
- Themes
- Aliases
- Shell configuration


Example:


Add aliases:


```bash
alias gs="git status"

alias gp="git push"

alias ll="ls -la"

```


---

# 💻 VS Code Customization


VS Code setup is handled by:


```
scripts/11-vscode.sh
```


You can add:


- Extensions
- Themes
- Settings


Example:


Extensions:


```text
ms-python.python

ms-toolsai.jupyter

esbenp.prettier-vscode

```


---

# 🧪 Testing Custom Changes


Before using in production:


Run:


```bash
./verify.sh
```


Check:


- Installed tools
- Environment variables
- Services
- Dependencies


For problems:


```bash
./doctor.sh
```


---

# ✅ Best Practices


When adding custom features:


✅ Keep scripts modular

✅ Add comments

✅ Handle errors

✅ Check existing installation

✅ Add verification steps

✅ Update documentation


---

# 🚀 Future Customization Ideas


Planned:


- YAML configuration support
- Plugin architecture
- Community modules
- Cloud profiles
- GUI customization panel
- Remote server setup


---

# Summary


The toolkit is designed to grow with developers.


You can start with:

```
Basic Setup

↓

Add Technologies

↓

Create Profiles

↓

Build Your Own Developer Environment

```


The goal is to create a flexible automation platform for every developer workflow.