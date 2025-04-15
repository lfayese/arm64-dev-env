![Build Status](https://github.com/lfayese/arm64-dev-env/actions/workflows/ci.yml/badge.svg)

# ARM64 Ubuntu Dev Environment Bootstrap

This package contains a one-command setup script for provisioning a complete developer environment on **ARM64 Ubuntu**.

## 💻 Features

- VS Code Insiders (Snap)
- PowerShell (Snap + .NET)
- .NET SDK 8.0 + 9.0
- Node.js + npm (Snap)
- Java (OpenJDK 17)
- Go (Snap)
- Python 3.12 + pip
- Formatters: black, shfmt, prettier
- jq, git, Docker, Docker Compose, kubectl
- Global .NET tools: `dotnetsay`, `PowerShell`

## 🧑‍💻 Setup Instructions

```bash
chmod +x bootstrap.sh
./bootstrap.sh
```

## ⚠️ Requirements

- Ubuntu 22.04 or later
- sudo access
- Internet connection

---

Everything is installed **headlessly** using Snap, apt, and the .NET CLI with retry logic. No manual steps needed.


---

## 🧠 GitHub Codespaces Support

This repo is ready for [GitHub Codespaces](https://github.com/features/codespaces).  
Simply open the repo in GitHub and click **"Code → Codespaces → Create codespace"**.

It uses `.devcontainer/docker-compose.yml` and has all tools preinstalled.

---

## 🧰 Services (docker-compose)

- PostgreSQL @ `localhost:5432`
- Redis @ `localhost:6379`
- App Port Forward: 3000, 5000



# C# ARM64 Dev Environment Docker Image

This Docker image contains a complete ARM64-compatible developer environment.

## ✅ Included Tools

- .NET SDK 8.0 + 9.0
- Node.js + npm + prettier
- Python 3 + pip + black
- Go 1.22.2
- Docker CLI, Docker Compose
- jq, shfmt, git
- kubectl
- PowerShell (global tool)
- dotnetsay

## 🚀 Build & Run

```bash
docker build -t arm64-dev-env .
docker run -it arm64-dev-env
```

This is a headless container for CLI development workflows on ARM64 (e.g. Raspberry Pi, AWS Graviton).
