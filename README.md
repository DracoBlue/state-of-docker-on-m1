# state-of-docker-on-m1

Since making docker desktop unavailable for free to larger organizations, there are multiple alternatives people might
evaluate. But there is also a difference between Apple M1 and Apple Intel devices. Thus this little repository provides
information of the state of how which setup compares in terms of working.

## Results

Last update: 2022-08-12

| Test ID             | Summary                      | [rancher-desktop-dockerd on m1](./setups/rancher-desktop-dockerd-m1.md) | [colima](./setups/colima-m1.md) | [podman-m1](./setups/podman-m1.md) | [docker-desktop-m1](./setups/docker-desktop-m1.md) | [minikube-hyperkit-m1](./setups/minikube-hyperkit-m1.md) | [minikube-docker-desktop-m1](./setups/minikube-docker-desktop-m1.md) | [docker-desktop on intel](./setups/docker-desktop-intel.md) | [ubuntu-amd64](./setups/ubuntu-amd64.md) |
|---------------------|------------------------------|-----------------------------------------------------------------------|---------------------------------|-----------------------------------|---------------------------------------------------|----------------------------------------------------------|---------------------------------------------------------------------|-------------------------------------------------------------|------------------------------------------|
|                     |                              | v1.7.0                                                                | v0.4.4                          | v4.2.0                            | v20.10.17                                         | v1.25.1                                                  | v1.16.1                                                             | v20.10.17                                                   | v20.10.17                                |
| [t1](./tests/t1.sh) | trusty openresty amd64 image | 🛑                                                                    | 🛑                              | ❌                                 | 🛑                                                | ❌                                                        | 🛑                                                                  | ✅                                                           | ✅                                        |
| [t2](./tests/t2.sh) | alpine openresty amd64 image | ✅                                                                     | ✅                               | ❌                                 | ✅                                                 | ❌                                                        | ✅                                                                   | ✅                                                           | ✅                                        |
| [t3](./tests/t3.sh) | old stern amd64 image        | ✅                                                                      | 🛑                              | ✅                                 | 🛑                                                | ❌                                                        | ✅                                                                   | ✅                                                           | ✅                                        |
| [t4](./tests/t4.sh) | current stern amd64 image    | ✅                                                                     | ✅                               | ✅                                 | ✅                                                 | ❌                                                        | ✅                                                                   | ✅                                                           | ✅                                        |
| [t5](./tests/t5.sh) | varnish 6.0.10 image         | 🛑                                                                      | 🛑                              | ✅                                 | ✅                                                 | ❌                                                        | ✅                                                                   |  ✅                                                          | ✅                                        |
| [t6](./tests/t6.sh) | applet not found regression  | ✅                                                                     |                               |                                   |                                                   | ❌                                                        |                                                                     |                                                             | ✅                                        |

Changes:

- rancher desktop from v1.5.1 to v1.6.2 fixed t3 on m1
- rancher desktop from v1.5.0 to v1.5.1, broke t3 and t5, but fixed t6 (see [rancher-desktop#2659](https://github.com/rancher-sandbox/rancher-desktop/issues/2659))
- rancher desktop from v1.1.1 to v1.5.0 fixed t3 and t5 on m1 but created t6
- podman from v3.4.4 to v4.2.0 t1+t2 openresty freezes now (also bad) and does not error (like before)

Hints:

1.  [minikube-hyperkit-m1](./setups/minikube-hyperkit-m1.md) does look so bad, because hyperkit is not supported on arm at all and will never be (see [moby/hyperkit#310](https://github.com/moby/hyperkit/issues/310) for more information).

## Setups

* M1 Mac Setups (on a MacBook Pro (16", 2021), Chip: `Apple M1 Pro`)
  * lima vm based:
    * ⚠️ [rancher-desktop-dockerd on m1](./setups/rancher-desktop-dockerd-m1.md)
    * ⚠️ [colima on m1](./setups/colima-m1.md)
  * qemu vm based:
    * ⚠️  [podman-m1](./setups/podman-m1.md)
  * docker desktop based:
    * ⚠️ [docker-desktop on m1](./setups/docker-desktop-m1.md)
    * ⚠️ [minikube-docker-desktop on m1](./setups/minikube-docker-desktop-m1.md)
  * hyperkit based:
    * ❌ [minikube-hyperkit on m1](./setups/minikube-hyperkit-m1.md) (unsupported because of [moby/hyperkit#310](https://github.com/moby/hyperkit/issues/310))
* Intel Mac Setups (on a MacBook Pro (16", 2019), Chip: `Intel Core i9`)
  * ✅ [docker-desktop on intel](./setups/docker-desktop-intel.md)
* Non Mac Setup (for comparison on Ubuntu x86_64):
  * ✅ [ubuntu-amd64](./setups/ubuntu-amd64.md)

## License

This work is copyright by DracoBlue (http://dracoblue.net) and licensed under the terms of MIT License.
