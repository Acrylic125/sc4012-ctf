FROM --platform=linux/amd64 kalilinux/kali-rolling:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    gdb \
    ghidra \
    python3 \
    python3-pip \
    python3-venv \
    unrar \
    && rm -rf /var/lib/apt/lists/*

# Install vim
RUN apt-get update && apt-get install -y vim

# Create virtual environment for pwntools
RUN python3 -m venv /opt/venv

# Use the venv for all future commands
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --no-cache-dir pwntools

WORKDIR /root

COPY challenge.rar /root/

# Unwrap the challenge
RUN unrar x challenge.rar

USER root