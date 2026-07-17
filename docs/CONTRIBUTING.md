# 🤝 Contributing Guide

## Developer Setup Automation Toolkit


Thank you for your interest in contributing to **Developer Setup Automation Toolkit**.


This document explains how you can contribute new features, fix issues, improve documentation, and add support for new technologies.


---

# 🌟 Ways to Contribute


You can contribute by:


- 🐛 Fixing bugs
- ✨ Adding new features
- 📦 Adding new installation modules
- 📝 Improving documentation
- 🔧 Improving scripts
- 🧪 Adding tests
- 💡 Suggesting improvements


---

# 📋 Before You Start


Before contributing:


1. Read the documentation:

```
docs/
├── INSTALLATION.md
├── ARCHITECTURE.md
├── CUSTOMIZATION.md
└── TROUBLESHOOTING.md
```


2. Check existing issues.

3. Create a plan before making major changes.


---

# 🚀 Development Setup


## Clone Repository


```bash
git clone <repository-url>

cd Developer-Setup
```


---

# Create Development Branch


Never work directly on the main branch.


Create a new branch:


```bash
git checkout -b feature-name
```


Examples:


```bash
git checkout -b add-java-support

git checkout -b improve-doctor-tool

git checkout -b fix-python-installation
```


---

# 📂 Project Structure


Before modifying code, understand the structure:


```text
Developer-Setup/

├── install.sh

├── verify.sh

├── doctor.sh

├── update.sh

├── uninstall.sh

│

├── scripts/

│   ├── installation modules

│   └── utilities

│

├── config/

│

├── docs/

│

└── logs/

```


---

# 🧩 Adding New Installation Modules


New technologies should be added as separate scripts.


Example:


Adding Java:


Create:


```text
scripts/14-java.sh
```


Example:


```bash
#!/bin/bash


echo "Installing Java"


sudo apt update

sudo apt install openjdk-21-jdk -y


java -version


echo "Java installation completed"

```


Follow these rules:


✅ Use numbered scripts

✅ Keep modules independent

✅ Add error handling

✅ Verify installation


---

# 🛠 Script Guidelines


All scripts should:


## 1. Check Existing Installation


Example:


```bash
command -v node
```


Avoid reinstalling existing tools.


---

## 2. Provide Clear Output


Good:


```bash
echo "Installing Node.js..."
```


Avoid unclear messages.


---

## 3. Handle Errors


Example:


```bash
if [ $? -ne 0 ]

then

echo "Installation failed"

exit 1

fi
```


---

## 4. Keep Scripts Simple


Prefer:


```
One script

=

One responsibility
```


Example:


Good:


```
09-ai.sh
```

Only AI environment.


Bad:


```
09-ai.sh
```

Installing AI + Docker + Database.


---

# 🧪 Testing Changes


Before submitting changes:


## Run Verification


```bash
./verify.sh
```


---

## Run Doctor


```bash
./doctor.sh
```


---

## Test Installation


Test affected module:


Example:


```bash
./scripts/09-ai.sh
```


---

# 📝 Commit Guidelines


Use meaningful commit messages.


Recommended format:


```
type: description
```


Examples:


### Feature


```bash
git commit -m "feat: add Java installation support"
```


### Bug Fix


```bash
git commit -m "fix: resolve MongoDB service issue"
```


### Documentation


```bash
git commit -m "docs: update installation guide"
```


### Refactoring


```bash
git commit -m "refactor: improve installer structure"
```


---

# 📌 Commit Types


| Type | Usage |
|-|-|
| feat | New feature |
| fix | Bug fix |
| docs | Documentation |
| refactor | Code improvement |
| test | Testing |
| chore | Maintenance |


---

# 🔄 Pull Request Process


## 1. Update Your Branch


```bash
git pull origin main
```


---

## 2. Push Changes


```bash
git push origin feature-name
```


---

## 3. Create Pull Request


Your PR should include:


### Title


Example:


```
Add Rust development environment support
```


---

### Description


Include:


- What changed
- Why it was needed
- How it was tested
- Screenshots (if required)


Example:


```text
Added Rust installation module.

Changes:
- Added scripts/15-rust.sh
- Updated installer menu
- Added verification check

Testing:
- Ubuntu 24.04
- WSL2
```


---

# ✅ Pull Request Checklist


Before submitting:


- [ ] Code follows project structure
- [ ] Scripts tested
- [ ] Documentation updated
- [ ] No unnecessary files added
- [ ] Error handling included
- [ ] verify.sh passes
- [ ] doctor.sh passes


---

# 🐛 Reporting Issues


When creating an issue, include:


## System Information


```bash
uname -a
```


Ubuntu version:


```bash
lsb_release -a
```


Toolkit verification:


```bash
./verify.sh
```


Logs:


```
logs/
```


---

# 💡 Feature Requests


For new features provide:


- Problem description
- Proposed solution
- Expected behavior
- Possible implementation


Example:


```
Feature:
Add Kubernetes development setup


Reason:
Useful for DevOps workflows


Implementation:
Create scripts/16-kubernetes.sh
```


---

# 🏗 Development Philosophy


This project follows:


## Modular Design

Every technology should have its own module.


## Safe Automation

Never break existing environments.


## Developer First

Tools should improve productivity.


## Documentation First

Every feature should be documented.


---

# 🎯 Future Contributors


Good first contributions:


- Add new language support
- Improve error messages
- Add verification checks
- Improve documentation
- Add Linux distribution support


---

# 🙌 Thank You


Every contribution helps make developer environment setup faster and easier.

Happy Building 🚀