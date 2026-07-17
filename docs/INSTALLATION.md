# 🚀 Installation Guide

Complete guide to install and configure **Developer Setup Automation Toolkit**.

This document explains how to prepare your system, run the installer, choose installation modes, and verify your development environment.

---

# 📋 Requirements

Before starting installation, make sure your system meets the following requirements.

## Supported Operating Systems

| OS | Support |
|-|-|
| Ubuntu 22.04 | ✅ Supported |
| Ubuntu 24.04 | ✅ Supported |
| WSL2 Ubuntu | ✅ Supported |
| Other Linux distributions | ⚠️ Not officially tested |

---

## System Requirements

Recommended:

| Requirement | Minimum |
|-|-|
| RAM | 4GB+ |
| Storage | 20GB+ free space |
| Internet | Required |
| Permissions | sudo access |

---

# 📦 Installation Steps

## 1. Clone Repository

Clone the repository using Git:

```bash
git clone <repository-url>
```

Navigate into the project:

```bash
cd Developer-Setup
```

---

# 2. Give Execute Permission

The toolkit uses Bash scripts.

Give execution permission:

```bash
chmod +x *.sh
```

Or individually:

```bash
chmod +x install.sh
chmod +x verify.sh
chmod +x doctor.sh
chmod +x update.sh
chmod +x uninstall.sh
```

---

# 3. Start Installer

Run:

```bash
./install.sh
```

The installer menu will appear.

Example:

```text
=================================
 Developer Setup Installer
=================================

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

=================================
```

---

# 🎯 Installation Modes

The toolkit provides multiple installation options.

---

# 1️⃣ Full Developer Setup

Recommended for a complete development machine.

Installs:

```text
System Utilities

        ↓

Terminal Setup

        ↓

Git Configuration

        ↓

Node.js Environment

        ↓

Databases

        ↓

Python AI Environment

        ↓

Docker

        ↓

VS Code Setup

        ↓

Developer Workspace
```

Includes:

- Ubuntu utilities
- Zsh
- Powerlevel10k
- Git setup
- Node.js ecosystem
- PostgreSQL
- MongoDB
- Redis
- Python environment
- AI/ML packages
- Docker
- VS Code extensions

---

# 2️⃣ Web Development Setup

Designed for Full Stack developers.

Installs:

## Runtime

```text
Node.js

├── npm
├── pnpm
├── Bun
└── Nodemon
```

## Databases

```text
PostgreSQL

MongoDB

Redis
```

## Tools

```text
Docker

Docker Compose

VS Code
```

Useful for:

- MERN applications
- Backend APIs
- Full-stack projects
- Database applications

---

# 3️⃣ AI / ML Setup

Creates a Python-based Artificial Intelligence environment.

Installed packages:

```text
Python Virtual Environment

        |
        |
        +── NumPy
        |
        +── Pandas
        |
        +── Matplotlib
        |
        +── Scikit-learn
        |
        +── PyTorch
        |
        +── OpenCV
        |
        +── Transformers
        |
        +── LangChain
        |
        +── LangGraph
        |
        +── LlamaIndex
        |
        +── FAISS
        |
        +── ChromaDB
```

Useful for:

- Machine Learning
- Deep Learning
- Computer Vision
- NLP
- Generative AI
- RAG applications

---

# 4️⃣ Database Setup

Installs and configures:

## PostgreSQL

Features:

- Automatic installation
- Service configuration
- User setup
- Connection testing


## MongoDB

Features:

- MongoDB server installation
- Service configuration
- Connectivity verification


## Redis

Features:

- Redis installation
- Cache service setup
- Health checking

---

# 5️⃣ DevOps Setup

Installs:

```text
Docker

Docker Compose

GitHub CLI

Lazygit

Developer CLI Tools
```

Useful for:

- Container development
- Deployment workflows
- DevOps learning
- Cloud environments

---

# ⚙️ Configuration

Configuration files are stored in:

```text
config/
```

Structure:

```text
config/

├── packages.conf

├── node-tools.conf

├── ai-packages.conf

└── settings.conf
```

---

# 🛠 Custom Installation

For advanced users:

Select:

```
2) Custom Setup
```

Choose only required components.

Example:

```text
Install Node.js only

Install AI environment only

Install Database only
```

---

# 🔍 Verify Installation

After installation completes:

Run:

```bash
./verify.sh
```

The verification system checks:

## System

```text
✓ Ubuntu

✓ Git

✓ Shell

✓ PATH
```

---

## Development Tools

```text
✓ Node.js

✓ npm

✓ pnpm

✓ Bun

✓ Nodemon
```

---

## Databases

```text
✓ PostgreSQL

✓ MongoDB

✓ Redis
```

---

## AI Environment

```text
✓ Python

✓ Virtual Environment

✓ AI Libraries
```

---

## DevOps

```text
✓ Docker

✓ Docker Compose
```

---

# 🩺 Troubleshooting

If any component fails:

Run:

```bash
./doctor.sh
```

Doctor checks:

- Missing commands
- PATH issues
- Service failures
- Database health
- Python environment
- Docker status

More details:

```
docs/TROUBLESHOOTING.md
```

---

# 🔄 Updating Installation

To update installed tools:

```bash
./update.sh
```

The updater manages:

- Ubuntu packages
- Node packages
- Python packages
- Docker cleanup
- Installer updates

---

# 🗑 Removing Installation

To remove components:

```bash
./uninstall.sh
```

Available options:

```text
1) Remove Developer Tools

2) Remove Node Environment

3) Remove Python AI Environment

4) Remove Databases

5) Remove Docker

6) Clean Workspace

7) Full Cleanup
```

---

# 📂 Generated Workspace

After setup:

```text
~/Developer
```

Created structure:

```text
Developer/

├── Projects

├── FullStack

├── AI-ML

├── DataScience

├── Experiments

├── Learning

│   ├── Notes

│   ├── Courses

│   └── Practice

├── Scripts

└── Temp
```

---

# 📊 Logs

Installation logs are stored in:

```text
logs/
```

Example:

```text
logs/

└── 2026-07-17.log
```

Logs help with:

- Debugging
- Installation history
- Error tracking

---

# ✅ Installation Complete

After successful installation:

You should have a complete developer environment ready for:

- Web Development
- AI/ML Development
- Database Projects
- DevOps Workflows

Start building 🚀