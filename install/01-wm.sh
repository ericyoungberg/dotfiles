#!/bin/bash

echo '[--01--] Window Manager (i3 + rofi + feh + compton)'
set -e;


# Install i3

CWD="$PWD"

apt-get install -y \
  libxcb1-dev \
  libxcb-keysyms1-dev \
  libpango1.0-dev \
  libxcb-util0-dev \
  libxcb-icccm4-dev \
  libyajl-dev \
  libstartup-notification0-dev \
  libxcb-randr0-dev \
  libev-dev \
  libxcb-cursor-dev \
  libxcb-xinerama0-dev \
  libxcb-xkb-dev \
  libxkbcommon-dev \
  libxkbcommon-x11-dev \
  libxcb-shape0-dev \
  xutils-dev


cd /tmp
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
make install 
cd "$CWD"
rm -rf /tmp/xcb-util-xrm

mkdir ~/i3-gaps_tmp
cd ~/i3-gaps_tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
make install
cd "$CWD"
rm -rf ~/i3-gaps_tmp


# Install Rofi + feh + Compton

apt-get install -y \
  compton \
  feh \
  fonts-hack-ttf \
  i3lock \
  i3status \
  libanyevent-i3-perl \
  lxappearance \
  rofi \
  x11-xserver-utils # xrandr


set +e;
echo '[--01--] End Window Manager'
