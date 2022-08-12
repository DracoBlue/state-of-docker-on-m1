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

if [ ! `which minikube` ]
then
  echo "Install minikube"
  brew install minikube
else
  echo "Skip minikube, because already available"
fi

brew upgrade minikube

IS_MINIKUBE_NOT_RUNNING=`minikube status | grep "minikube start" || true`
if [ "$IS_MINIKUBE_NOT_RUNNING" ]
then
  echo "Start minikube vm"
  minikube start --driver=docker --no-kubernetes=true
else
  echo "Skip starting of minikube vm, because already running"
fi