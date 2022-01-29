# minikube docker desktop m1 setup for state-of-docker-on-m1

## installation steps

Manual Steps:

1. install docker for mac https://docs.docker.com/desktop/mac/install/
2. Manually install "XCode" in App Store
3. Install rosetta 2

```
$ softwareupdate --install-rosetta
```

Automated Steps:

The automated steps (after installing xcode manually via app store) are included in [minikube-docker-desktop-m1.sh](./minikube-docker-desktop-m1.sh).

1. Homebrew <https://brew.sh/>
2. Install "Rosetta 2"
4. Install minikube
5. Launch minikube VM 
6. Configure docker cli

```console
$ eval $(minikube -p minikube docker-env)
```

## Uninstall steps

1. Stop minikube vm

```console
$ minikube delete
```

2. Uninstall

```console
$ brew uninstall minikube
```