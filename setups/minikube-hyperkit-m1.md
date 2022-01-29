# minikube hyperkit m1 setup for state-of-docker-on-m1

IMPORTANT 2022-01-29: ⚠️ Hyperkit is not supported on non-x86-systems as of https://github.com/moby/hyperkit/issues/310.

```console
$ minikube start --driver=hyperkit --no-kubernetes=true
 minikube v1.25.1 on Darwin 12.1 (arm64)
    ▪ MINIKUBE_ACTIVE_DOCKERD=minikube
✨  Using the hyperkit driver based on user configuration

❌  Exiting due to DRV_UNSUPPORTED_OS: The driver 'hyperkit' is not supported on darwin/arm64
```

## installation steps

Manual Steps:

1. Manually install "XCode" in App Store

Automated Steps:

The automated steps (after installing xcode manually via app store) are included in [minikube-hyperkit-m1.sh](./podman-m1.sh).

1. Homebrew <https://brew.sh/>
3. Install hyperkit
4. Install minikube
5. Launch minikube VM 
6. Configure docker cli

```console
$ eval $(minikube -p minikube docker-env)
```
7. Install binfmt (am64 emulator) into Docker

## Uninstall steps

1. Stop colima vm

```console
$ minikube stop
```

2. Uninstall

```console
$ brew uninstall colima docker-compose docker
```