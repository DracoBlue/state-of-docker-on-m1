# podman setup for state-of-docker-on-m1

## installation steps

The steps are included in [podman-m1.sh](./podman-m1.sh).

Steps:

1. Homebrew <https://brew.sh/>
2. Install podman with Brew
3. Init Podman VM
4. Start Podman VM
5. Symlink docker cli to podman cli

## Uninstall steps

1. Stop and delete podman vm

```console
$ podman machine stop
$ podman machine rm --force
```

2. Uninstall

```console
$ brew uninstall podman
```

3. Remove docker symlink

```console
$ rm /usr/local/bin/docker
```