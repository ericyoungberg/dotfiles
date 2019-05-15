#!/bin/bash

echo '[--03--] Applications'
set -e;

CWD="$PWD"

apt-get install -y \
  dict \
  htop \
  nmap \
  ranger \
  rxvt-unicode \
  shellcheck \
  silversearcher-ag \
  thunar \
  tmux \
  unclutter \
  vim 


# Install WTF dashboard panel

mkdir -p /tmp/wtf_install
cd /tmp/wtf_install
wget https://github.com/wtfutil/wtf/releases/download/0.6.0/wtf_0.6.0_linux_amd64.tar.gz
tar -xzvf wtf_0.6.0_linux_amd64.tar.gz
cp wtf_0.6.0_linux_amd64/wtf /usr/local/bin/wtf
cd "$CWD"
rm -rf /tmp/wtf_install


# Install Slack

mkdir -p /tmp/slack_install
cd /tmp/slack_install
wget http://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
dpkg -i slack-desktop-3.3.8-amd64.deb
cd "$CWD"
rm -rf /tmp/slack_install


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
