# syntax=docker/dockerfile:1

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DOTNET_ROOT=/usr/share/dotnet
ENV PATH="$PATH:/root/.dotnet/tools"

# Install core packages and Snap
RUN apt-get update && apt-get install -y \
    curl wget git sudo gnupg software-properties-common \
    apt-transport-https ca-certificates lsb-release \
    python3 python3-pip python3-black shfmt jq docker.io docker-compose \
    openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Install Snap (Docker containers can't use snapd, so we skip Snap tools)
# Instead we manually install Go, Node, VS Code CLI, and PowerShell

# Install .NET SDKs 9.0 and 8.0
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y dotnet-sdk-9.0 dotnet-sdk-8.0 && \
    rm packages-microsoft-prod.deb

# Install Node.js + npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Install Prettier
RUN npm install -g prettier

# Install Go
RUN curl -LO https://go.dev/dl/go1.22.2.linux-arm64.tar.gz && \
    tar -C /usr/local -xzf go1.22.2.linux-arm64.tar.gz && \
    rm go1.22.2.linux-arm64.tar.gz
ENV PATH="/usr/local/go/bin:$PATH"

# Install PowerShell as .NET Global Tool
RUN dotnet tool install -g PowerShell

# Install dotnetsay
RUN dotnet tool install -g dotnetsay

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin/

# Show installed versions
CMD ["/bin/bash"]
