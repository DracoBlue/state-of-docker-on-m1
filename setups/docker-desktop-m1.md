# docker-desktop m1 setup for state-of-docker-on-m1


## installation steps

Steps:

1. install docker for mac https://docs.docker.com/desktop/mac/install/
2. activate "rosetta 2" emulator for amd64

```console
$ softwareupdate --install-rosetta
```

## uninstall steps


Remove from "~/.docker/config.json" the key value

```
"credsStore" : "desktop",
```