# ARM64 Dev Environment Docker Image

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
