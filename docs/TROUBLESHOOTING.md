# 🩺 Troubleshooting Guide

## Developer Setup Automation Toolkit


This guide helps you diagnose and fix common issues while installing or using the **Developer Setup Automation Toolkit**.


If any installation step fails, first run:


```bash
./doctor.sh
```


The Doctor utility automatically checks:

- Environment configuration
- PATH settings
- Missing commands
- Services
- Dependencies
- Database health
- Python environment
- Docker setup


---

# 🔍 General Debugging


## Check Installation Logs


All installation activities are stored in:


```bash
logs/
```


Example:


```text
logs/

└── 2026-07-17.log
```


View logs:


```bash
cat logs/latest.log
```


---

# 🐧 Ubuntu Issues


## Problem: Package Installation Failed


### Error


```text
Unable to locate package
```


### Solution


Update package repository:


```bash
sudo apt update
```


Upgrade packages:


```bash
sudo apt upgrade -y
```


Retry installation.


---

# 🔐 Permission Errors


## Problem


```text
Permission denied
```


### Solution


Give execute permission:


```bash
chmod +x *.sh
```


For scripts:


```bash
chmod +x scripts/*.sh
```


---

# 🌐 Network Issues


## Problem


```text
Could not connect to server
```


### Solution


Check internet:


```bash
ping google.com
```


Restart package manager:


```bash
sudo apt update
```


---

# 🟢 Node.js Issues


## Problem: Node command not found


### Error


```text
node: command not found
```


### Solution


Check installation:


```bash
node --version
```


If missing:


Run:


```bash
./install.sh
```


Select:


```
Web Development Setup
```


---

# Problem: npm Permission Error


### Error


```text
EACCES permission denied
```


### Solution


Fix npm directory:


```bash
mkdir ~/.npm-global
```


Set path:


```bash
npm config set prefix '~/.npm-global'
```


Add to PATH:


```bash
export PATH=$PATH:~/.npm-global/bin
```


---

# Problem: pnpm Not Found


Check:


```bash
pnpm --version
```


Reinstall:


```bash
npm install -g pnpm
```


---

# 🐍 Python Issues


## Problem: Virtual Environment Failed


### Error


```text
venv creation failed
```


### Solution


Install:


```bash
sudo apt install python3-venv -y
```


Create manually:


```bash
python3 -m venv venv
```


---

# Problem: AI Package Installation Failed


Example:


```text
Failed building wheel
```


### Solution


Upgrade pip:


```bash
pip install --upgrade pip setuptools wheel
```


Retry:


```bash
./scripts/09-ai.sh
```


---

# Problem: PyTorch Installation Issue


Check Python:


```bash
python --version
```


Check pip:


```bash
pip --version
```


Install manually:


```bash
pip install torch torchvision torchaudio
```


---

# 🗄 Database Issues


# PostgreSQL


## Problem: PostgreSQL Service Not Running


Check:


```bash
sudo systemctl status postgresql
```


Start:


```bash
sudo systemctl start postgresql
```


Enable:


```bash
sudo systemctl enable postgresql
```


---

# MongoDB


## Problem: MongoDB Not Starting


Check:


```bash
sudo systemctl status mongodb
```


Start:


```bash
sudo systemctl start mongodb
```


Test:


```bash
mongosh
```


---

# Redis


## Problem: Redis Connection Failed


Check:


```bash
redis-cli ping
```


Expected:


```text
PONG
```


Restart:


```bash
sudo systemctl restart redis
```


---

# 🐳 Docker Issues


## Problem: Permission Denied


### Error


```text
permission denied while trying to connect docker
```


### Solution


Add user:


```bash
sudo usermod -aG docker $USER
```


Restart shell:


```bash
exit
```


Verify:


```bash
docker run hello-world
```


---

# Problem: Docker Service Not Running


Check:


```bash
docker status
```


Start:


```bash
sudo systemctl start docker
```


---

# 💻 VS Code Issues


## Problem: VS Code Command Not Found


Check:


```bash
code --version
```


If missing:


Reinstall VS Code:


```bash
./scripts/11-vscode.sh
```


---

# 🔧 PATH Issues


## Problem


Installed tools are not detected.


Example:


```text
command not found
```


### Check PATH


```bash
echo $PATH
```


Reload shell:


```bash
source ~/.bashrc
```


or:


```bash
source ~/.zshrc
```


---

# 🖥 WSL Issues


## Problem: WSL Performance Slow


Solutions:


### Limit resources


Create:


```
C:\Users\<username>\.wslconfig
```


Example:


```ini
[wsl2]

memory=4GB

processors=4

swap=2GB
```


Restart:


```powershell
wsl --shutdown
```


---

# Problem: Windows Files Access Slow


Avoid running projects from:


```text
/mnt/c/
```


Recommended:


```text
/home/user/projects
```


Linux filesystem provides better performance.


---

# 🔄 Installation Failed Halfway


If installation stops:


## Step 1


Run:


```bash
./doctor.sh
```


## Step 2


Check failed component.


Example:


```bash
./scripts/09-ai.sh
```


## Step 3


Run verification:


```bash
./verify.sh
```


---

# 🧹 Complete Reset


If you want a clean reinstall:


Run:


```bash
./uninstall.sh
```


Choose:


```text
Full Cleanup
```


Then reinstall:


```bash
./install.sh
```


---

# 🆘 Getting Help


Before creating an issue, collect:


System information:


```bash
uname -a
```


Ubuntu version:


```bash
lsb_release -a
```


Toolkit logs:


```bash
logs/
```


Installed tools:


```bash
./verify.sh
```


Include these details in your GitHub issue.


---

# ✅ Troubleshooting Checklist


Before asking for help:


- [ ] Checked internet connection
- [ ] Updated Ubuntu packages
- [ ] Ran doctor.sh
- [ ] Checked logs
- [ ] Ran verify.sh
- [ ] Included error details


---

# Summary


Most issues can be solved using:


```text
doctor.sh

      ↓

logs/

      ↓

verify.sh

      ↓

Fix component

      ↓

Ready Environment 🚀
```

