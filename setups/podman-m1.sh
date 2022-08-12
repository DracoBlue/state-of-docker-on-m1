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

if [ ! `which podman` ]
then
  echo "Install podman"
  brew install podman
else
  echo "Skip podman, because already available"
fi

echo "upgrade podman version (if available)"
brew upgrade podman

IS_PODMAN_MACHINE_RUNNING=`podman machine list 2>&1 | grep "podman-machine-default" || true`
if [ "$IS_PODMAN_MACHINE_RUNNING" ]
then
  echo "Skip initializing of podman machine, because already initialized"
else
  echo "Initialize podman machine vm"
  podman machine init --cpus 4 --memory 8192
fi

IS_PODMAN_MACHINE_NOT_RUNNING=`podman system info 2>&1 | grep "podman machine start" || true`
if [ "$IS_PODMAN_MACHINE_NOT_RUNNING" ]
then
  echo "Start podman machine vm"
  podman machine start
else
  echo "Skip starting of podman machine, because already running"
fi

IS_DOCKER_CLI_ALREADY_PODMAN=`docker help | grep "URL to access Podman service" || true`
if [ "$IS_DOCKER_CLI_ALREADY_PODMAN" ]
then
  echo "Skip symlinking podman as docker cli, because is already podman"
else
  echo "Symlink /usr/local/bin/docker to `which podman`"
  rm /usr/local/bin/docker
  ln -s `which podman` /usr/local/bin/docker
fi