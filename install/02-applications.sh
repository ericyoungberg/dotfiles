#!/bin/bash

echo '[--03--] Applications'
set -e;

CWD="$PWD"

apt-get install -y \
  dict \
  gpick \
  htop \
  nmap \
  ranger \
  rxvt-unicode \
  shellcheck \
  silversearcher-ag \
  thunar \
  tumbler \
  tumbler-plugins-extra \
  tmux \
  unclutter \
  vim 


# Install Docker + docker-compose

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt-get update -qq \
&& apt-get install -y docker-ce
usermod -aG docker "$USER"

COMPOSE_PATH=/usr/local/bin/docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o "$COMPOSE_PATH"
chmod +x "$COMPOSE_PATH"


set +e;
echo '[--03--] End Applications'
