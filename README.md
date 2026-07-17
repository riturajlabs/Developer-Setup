# 🚀 Developer Setup Automation Toolkit


<p align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=240&color=0:0B1026,40:2563EB,100:60A5FA&text=Developer%20Setup%20Toolkit&fontSize=45&fontColor=ffffff&fontAlignY=35&desc=Automated%20Development%20Environment%20Provisioning&descAlignY=60&descSize=22"/>

</p>


<p align="center">

<strong>
One command to setup your complete developer environment.
</strong>

<br>

From Web Development, AI/ML, Databases to DevOps — automate everything with a modular Bash toolkit.

</p>


<p align="center">

<img src="https://img.shields.io/badge/Linux-Ubuntu-orange?style=for-the-badge&logo=linux"/>

<img src="https://img.shields.io/badge/WSL2-Supported-blue?style=for-the-badge&logo=windows"/>

<img src="https://img.shields.io/badge/Shell-Bash-green?style=for-the-badge&logo=gnubash"/>

<img src="https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker"/>

<img src="https://img.shields.io/badge/AI%2FML-Ready-purple?style=for-the-badge"/>

</p>


<p align="center">

<img src="https://img.shields.io/github/license/riturajlabs/Developer-Setup?style=for-the-badge"/>

<img src="https://img.shields.io/github/stars/riturajlabs/Developer-Setup?style=for-the-badge"/>

<img src="https://img.shields.io/github/forks/riturajlabs/Developer-Setup?style=for-the-badge"/>

</p>


---

# 📖 Overview


**Developer Setup Automation Toolkit** is a modular Bash-based automation framework designed to configure a complete professional development environment automatically.


Instead of spending hours installing and configuring tools manually, this toolkit provides a repeatable setup workflow for developers.


It supports:


- 🌐 Full Stack Web Development
- 🤖 Artificial Intelligence & Machine Learning
- 🗄 Database Development
- 🐳 DevOps Environment
- 🛠 Developer Productivity Tools


The goal:


> Setup once. Build faster. Focus on development.


---

# 💡 Why This Project?


Setting up a new development machine is repetitive and time-consuming.


Developers usually need to install:


- Programming languages
- Package managers
- Databases
- Development tools
- Terminal customization
- AI libraries
- Docker environment
- Editor configuration


This toolkit solves that problem by providing:


✅ Automated installation  
✅ Modular architecture  
✅ Environment verification  
✅ Troubleshooting utilities  
✅ Safe updates  
✅ Easy customization  


---

# ✨ Key Features


## 🖥 Complete System Setup


Automatically configures:


- Ubuntu packages
- Essential CLI tools
- Zsh terminal
- Powerlevel10k theme
- Git environment


---


## 🌐 Web Development Environment


Supports modern full-stack development:


| Technology | Included |
|---|---|
| Node.js | ✅ |
| npm | ✅ |
| pnpm | ✅ |
| Bun | ✅ |
| Nodemon | ✅ |
| PostgreSQL | ✅ |
| MongoDB | ✅ |
| Redis | ✅ |


Perfect for:


- MERN applications
- Backend APIs
- Full-stack projects
- Database applications


---


## 🤖 AI / Machine Learning Environment


Creates a complete Python AI ecosystem:


| Library | Purpose |
|---|---|
| NumPy | Numerical Computing |
| Pandas | Data Analysis |
| Matplotlib | Visualization |
| Scikit-learn | Machine Learning |
| PyTorch | Deep Learning |
| OpenCV | Computer Vision |
| Transformers | NLP & LLMs |
| LangChain | LLM Applications |
| LangGraph | AI Agents |
| LlamaIndex | Data Framework |
| FAISS | Vector Search |
| ChromaDB | Vector Database |


Designed for:


- Machine Learning
- Deep Learning
- Computer Vision
- Generative AI
- RAG Applications
- AI Agents


---


## 🐳 DevOps Environment


Includes:


- Docker
- Docker Compose
- GitHub CLI
- Lazygit
- Developer utilities


Useful for:


- Container development
- Deployment workflows
- DevOps learning


---


# 🧰 Supported Technologies


| Category | Technologies |
|---|---|
| OS | Ubuntu 22.04 / 24.04, WSL2 |
| Shell | Bash, Zsh |
| Terminal | Powerlevel10k |
| Runtime | Node.js, Python |
| Package Managers | npm, pnpm, Bun |
| Backend | Node.js, Express.js |
| Database | PostgreSQL, MongoDB, Redis |
| AI/ML | PyTorch, Transformers, LangChain |
| Vector Database | FAISS, ChromaDB |
| DevOps | Docker, Docker Compose |
| Editor | VS Code |
| CLI Tools | GitHub CLI, Lazygit, HTTPie |


---

# 🏗 Architecture Overview


The toolkit follows a modular architecture where every setup component works as an independent module.


```mermaid
flowchart TD

A[Developer]

B[install.sh<br>Main Controller]

C[Installation Modules]

D[Configuration Layer]

E[Developer Environment]

F[Verification System]


A --> B

B --> C

C --> D

D --> E

E --> F

```md
---


Architecture principles:


| Principle | Description |
|---|---|
| 🧩 Modular | Every component has independent installation scripts |
| 🛡 Safe | Detects existing installations before changes |
| ♻️ Reusable | Scripts can run independently |
| 🚀 Extensible | Easy to add new technologies |
| 👨‍💻 Developer Friendly | Includes verification and diagnostic tools |


Detailed architecture:

➡️ [Architecture Documentation](docs/ARCHITECTURE.md)


---

# 📂 Project Structure


```text
Developer-Setup/

│
├── install.sh              # Main installation controller
├── verify.sh               # Environment verification
├── doctor.sh               # Troubleshooting utility
├── update.sh               # Update system
├── uninstall.sh            # Cleanup utility
│
├── scripts/
│
│   ├── 01-base.sh          # Ubuntu packages
│   ├── 02-terminal.sh      # Zsh + Powerlevel10k
│   ├── 03-git.sh           # Git configuration
│   ├── 04-node.sh          # Node.js ecosystem
│   ├── 05-postgresql.sh    # PostgreSQL setup
│   ├── 06-mongodb.sh       # MongoDB setup
│   ├── 07-redis.sh         # Redis setup
│   ├── 08-python.sh        # Python environment
│   ├── 09-ai.sh            # AI/ML environment
│   ├── 10-docker.sh        # Docker setup
│   ├── 11-vscode.sh        # VS Code setup
│   ├── 12-devtools.sh      # Developer tools
│   └── 13-workspace.sh     # Workspace creation
│
├── config/                 # Configuration files
│
├── docs/                   # Detailed documentation
│
├── logs/                   # Installation logs
│
├── CHANGELOG.md
├── LICENSE
└── README.md


---

# ⚡ Quick Start


Setup your complete developer environment with a simple automated workflow.


## 📋 Requirements


| Requirement | Details |
|---|---|
| Operating System | Ubuntu 22.04 / 24.04 |
| Windows Support | WSL2 |
| Internet | Required |
| Permissions | sudo access |


---


# 📥 Installation


## Clone Repository


```bash
git clone https://github.com/riturajlabs/Developer-Setup.git

cd Developer-Setup
```


---


## Give Execute Permission


```bash
chmod +x *.sh
```


or


```bash
chmod +x install.sh verify.sh doctor.sh update.sh uninstall.sh
```


---


## Run Installer


```bash
./install.sh
```


The interactive installer menu:


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


Choose the environment according to your development requirements.


| Mode | Purpose |
|---|---|
| 🚀 Full Developer Setup | Complete development environment |
| 🌐 Web Development Setup | MERN stack and backend ecosystem |
| 🤖 AI / ML Setup | Python AI and Machine Learning environment |
| 🗄 Database Setup | PostgreSQL, MongoDB and Redis services |
| 🐳 DevOps Setup | Docker and DevOps tools |
| ⚙️ Custom Setup | Select required components |


Detailed installation guide:


➡️ [Installation Documentation](docs/INSTALLATION.md)


---


# 🔍 Verification System


After installation, verify your environment:


```bash
./verify.sh
```


The verification system checks:


```text
✓ System Tools

✓ Git Configuration

✓ Node.js Environment

✓ npm

✓ pnpm

✓ Bun

✓ Nodemon

✓ PostgreSQL

✓ MongoDB

✓ Redis

✓ Python Environment

✓ AI/ML Libraries

✓ Docker

✓ Docker Compose

✓ VS Code
```


Example output:


```text
=================================

 Developer Environment Check

=================================


[SUCCESS] Git

[SUCCESS] Node.js

[SUCCESS] PostgreSQL

[SUCCESS] MongoDB

[SUCCESS] Redis

[SUCCESS] Python AI Environment

[SUCCESS] Docker

[SUCCESS] VS Code


Passed : 36

Failed : 0


Environment Ready 🚀


=================================
```

---

---


# 🩺 Doctor Tool


The Doctor utility helps developers diagnose and troubleshoot development environment issues.


Run:


```bash
./doctor.sh
```


The Doctor tool checks:


- Environment configuration
- PATH issues
- Missing dependencies
- Broken installations
- Database services
- Python environment
- Docker status
- VS Code integration


Detailed troubleshooting:


➡️ [Troubleshooting Guide](docs/TROUBLESHOOTING.md)


---


# 🔄 Update System


Keep your development environment updated with the update utility.


Run:


```bash
./update.sh
```


Update workflow:


```text
System Packages

        ↓

Node.js Ecosystem

        ↓

Python Packages

        ↓

Docker Maintenance

        ↓

Toolkit Updates
```


---


# 🗑 Uninstall System


Remove installed components safely using the uninstall utility.


Run:


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

0) Exit
```


Safety features:


✅ Confirmation before deletion

✅ Selective component removal

✅ Protects user projects

✅ Detailed cleanup logs


---


# 📚 Documentation


Complete documentation is available inside the `docs/` directory.


| Document | Description |
|---|---|
| [INSTALLATION.md](docs/INSTALLATION.md) | Complete installation guide |
| [ARCHITECTURE.md](docs/ARCHITECTURE.md) | System architecture details |
| [CUSTOMIZATION.md](docs/CUSTOMIZATION.md) | Add new technologies |
| [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) | Fix common problems |
| [CONTRIBUTING.md](docs/CONTRIBUTING.md) | Contribution guidelines |


---

---

# 🛣 Roadmap


## ✅ Completed


- [x] Modular Bash installer
- [x] Ubuntu support
- [x] WSL2 support
- [x] Terminal customization
- [x] Zsh + Powerlevel10k setup
- [x] Git automation
- [x] Node.js environment
- [x] PostgreSQL setup
- [x] MongoDB setup
- [x] Redis setup
- [x] Python development environment
- [x] AI/ML libraries setup
- [x] Docker integration
- [x] VS Code automation
- [x] Verification system
- [x] Doctor troubleshooting tool
- [x] Safe uninstall system
- [x] Developer workspace creation


---


## 🚀 Future Improvements


- [ ] Java Development Setup
- [ ] Rust Development Setup
- [ ] Go Development Setup
- [ ] Kubernetes Automation
- [ ] Terraform Setup
- [ ] Cloud CLI Integration
- [ ] CI/CD Templates
- [ ] GUI Installer
- [ ] Configuration-based installation
- [ ] Multi Linux distribution support
- [ ] Backup and restore system


---


# 🔐 Security & Safety


The toolkit follows safe automation practices to prevent unwanted system changes.


Security features:


✅ Existing installation detection

✅ Safe package installation

✅ No hidden scripts

✅ User confirmation before destructive actions

✅ Detailed installation logs

✅ Error handling and validation


The installation workflow follows:


```text
Detect

 ↓

Validate

 ↓

Install

 ↓

Configure

 ↓

Verify
```


---


# 🤝 Contributing


Contributions are welcome!


If you want to improve this project:


## Fork Repository


```bash
git clone <repository-url>
```


## Create Feature Branch


```bash
git checkout -b feature-name
```


## Make Changes


Improve scripts, documentation, or add new technologies.


## Commit Changes


```bash
git commit -m "Add new feature"
```


## Push Changes


```bash
git push origin feature-name
```


Create a Pull Request with:


- Clear description
- Testing details
- Screenshots (if required)
- Reason for changes


Contribution guidelines:


➡️ [CONTRIBUTING.md](docs/CONTRIBUTING.md)


---


# 📄 License


This project is licensed under the **MIT License**.


You are free to:


- Use
- Modify
- Distribute
- Learn from this project


---


# ⭐ Support


If this project helped you:


⭐ Star the repository

📢 Share it with other developers

🤝 Contribute improvements


Your support helps the project grow.


---


# 👨‍💻 Author


<p align="center">


## Ritu Raj


AI & Machine Learning Student | Full Stack Developer | Developer Tools Enthusiast


<a href="https://github.com/riturajlabs">

<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github"/>

</a>


<a href="https://linkedin.com/in/riturajlabs">

<img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin"/>

</a>


</p>


---


# 🚀 Final Note


Developer Setup Automation Toolkit was created to reduce repetitive setup work and help developers start building faster.


Instead of spending hours configuring environments:


```text
Install once.

Configure automatically.

Start building.
```


---

<p align="center">

Built with ❤️ for developers.

</p>


<p align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:2563EB,100:60A5FA&height=120&section=footer"/>

</p>