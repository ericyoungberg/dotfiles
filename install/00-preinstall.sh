#!/bin/bash

echo '[--00--] Pre-install'
set -e;


# Ugrade and install essentials

apt-get update -qq \
&& apt-get upgrade -y

apt-get install -y \
  apt-transport-https \
  autoconf \
  automake \
  build-essential \
  ca-certificates \
  curl \
  git \
  libtool \
  software-properties-common \
  wget


set +e;
echo '[--00--] End Pre-install'
