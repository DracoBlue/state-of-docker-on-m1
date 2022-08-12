#!/bin/sh

set -e

if [ ! `which brew` ]
then
  echo "Install brew"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.profile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Skip brew, because already available"
fi

if [ ! `which docker` ]
then
  echo "Install docker"
  brew install docker
else
  echo "Skip docker (cli) install, because already available"
fi

if [ ! `which colima` ]
then
  echo "Install colima"
  brew install colima
else
  echo "Skip colima install, because already available"
fi

if [ ! `which docker-compose` ]
then
  echo "Install docker-compose"
  brew install docker-compose
else
  echo "Skip docker-compose install, because already available"
fi

echo "perform colima, docker and docker-compose upgrade (if available)"
brew upgrade colima docker docker-compose

IS_COLIMA_NOT_RUNNING=`colima status 2>&1 | grep "not running" || true`
if [ "$IS_COLIMA_NOT_RUNNING" ]
then
  echo "Start colima vm"
  colima start --runtime docker --cpu 4 --memory 8
else
  echo "Skip starting of colima vm, because already running"
fi

IS_COLIMA_AMD64_EMULATOR_RUNNING=`docker run --privileged --rm tonistiigi/binfmt | grep linux/amd64 || true`
if [ "$IS_COLIMA_AMD64_EMULATOR_RUNNING" ]
then
  echo "Skip starting of amd64 emulator, because already running"
else
  echo "Start amd64 emulator in docker"
  docker run --privileged --rm tonistiigi/binfmt --install amd64
fi