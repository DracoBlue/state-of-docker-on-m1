# colima setup for state-of-docker-on-m1

## installation steps

The steps are included in [colima-m1.sh](./colima-m1.sh).

Steps:

1. Homebrew <https://brew.sh/>
2. Docker CLI with Brew <https://formulae.brew.sh/formula/docker>
3. Colima with Brew <https://formulae.brew.sh/formula/colima>
4. Docker-Compose with Brew <https://formulae.brew.sh/formula/docker-compose>
5. Launch Colima VM
6. Install binfmt (amd64 emulator) into Docker

## Uninstall steps

1. Stop colima vm

```console
$ colima stop
```

2. Uninstall

```console
$ brew uninstall colima docker-compose docker
```
