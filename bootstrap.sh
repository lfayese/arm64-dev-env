#!/bin/bash
set -euo pipefail

ARCH=$(uname -m)
echo "📦 Architecture detected: $ARCH"

MAX_RETRIES=3

with_retry() {
  local n=1
  local delay=3
  until "$@"; do
    if (( n == MAX_RETRIES )); then
      echo "❌ Failed after $n attempts: $*"
      return 1
    else
      echo "⚠️ Attempt $n failed. Retrying in $delay sec..."
      sleep $delay
      ((n++))
    fi
  done
}

# Ensure snap is installed
if ! command -v snap >/dev/null; then
  echo "🛠 Installing snapd..."
  with_retry sudo apt update
  with_retry sudo apt install -y snapd
fi

# --- Snap Tools ---
echo "📦 Installing Snap tools..."

with_retry sudo snap install code-insiders --classic
with_retry sudo snap install powershell --classic
with_retry sudo snap install node --classic
with_retry sudo snap install go --classic

# --- APT Tools ---
echo "📦 Installing APT packages..."

with_retry sudo apt update
with_retry sudo apt install -y \
  openjdk-17-jdk \
  python3 python3-pip \
  python3-black \
  shfmt \
  jq \
  git \
  docker.io \
  docker-compose \
  apt-transport-https \
  ca-certificates \
  software-properties-common \
  gnupg curl

# Latest Python (via deadsnakes PPA if needed)
sudo add-apt-repository -y ppa:deadsnakes/ppa || true
with_retry sudo apt install -y python3.12 python3.12-venv python3.12-dev || true

# Ensure pip is linked
if ! command -v pip >/dev/null && command -v pip3 >/dev/null; then
  sudo ln -s $(command -v pip3) /usr/bin/pip
fi

# Install .NET SDKs
echo "🧰 Installing .NET SDK 9.0 and 8.0..."
with_retry sudo apt install -y dotnet-sdk-9.0 dotnet-sdk-8.0

# Ensure ~/.dotnet/tools in PATH
export PATH="$HOME/.dotnet/tools:$PATH"

# Install .NET global tools
echo "🧩 Installing .NET global tools..."
with_retry dotnet tool install --global dotnetsay
with_retry dotnet tool install --global PowerShell

# Install Prettier
if command -v npm >/dev/null; then
  with_retry sudo npm install -g prettier
else
  echo "⚠️ npm not found. Skipping Prettier."
fi

# Install kubectl
echo "📦 Installing kubectl..."
with_retry curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/$(uname -m)/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Final validation
echo "🎉 Bootstrap complete!"

echo -e "\nInstalled CLI tools:"
command -v code-insiders && echo "✓ code-insiders"
command -v pwsh && echo "✓ pwsh"
command -v node && echo "✓ node $(node --version)"
command -v go && echo "✓ go $(go version)"
command -v python3 && echo "✓ python3 $(python3 --version)"
command -v pip && echo "✓ pip $(pip --version)"
command -v dotnet && echo "✓ dotnet $(dotnet --version)"
command -v dotnetsay && echo "✓ dotnetsay"
command -v docker && echo "✓ docker"
command -v kubectl && echo "✓ kubectl"
