FROM ubuntu:22.04

# Install dependecies
# https://www.sigbus.info/compilerbook#%E6%9C%AC%E6%9B%B8%E3%81%AE%E6%83%B3%E5%AE%9A%E3%81%99%E3%82%8B%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gcc \
    make \
    git \
    binutils \
    libc6-dev \
    # Allow use sudo in container
    sudo

# Add user `vscode` with sudo privileges
RUN useradd -m vscode && echo "vscode:vscode" | chpasswd && adduser vscode sudo && \
    echo 'user ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/user

USER vscode
WORKDIR /home/vscode/workspace