# state-of-docker-on-m1

Since making docker desktop unavailable for free to larger organizations, there are multiple alternatives people might
evaluate. But there is also a difference between Apple M1 and Apple Intel devices. Thus this little repository provides
information of the state of how which setup compares in terms of working.

## Results

| Test ID             | Summary                      | [colima](./setups/colima-m1.md)  | [docker-desktop-m1](./setups/docker-desktop-m1.md) | [docker-desktop on intel](./setups/docker-desktop-intel.md) | [ubuntu-amd64](./setups/ubuntu-amd64.md) |
|---------------------|------------------------------|----------------------------------|---------------------------------------------------|-------------------------------------------------------------|-----------------------------------------|
| [t1](./tests/t1.sh) | trusty openresty amd64 image | 🛑                               | 🛑                                                  | ✅                                                           | ✅                                         |
| [t2](./tests/t2.sh) | alpine openresty amd64 image | ✅                               | ✅                                                  | ✅                                                           | ✅                                         |
| [t3](./tests/t3.sh) | old stern amd64 image        | 🛑                               | 🛑                                                  | ✅                                                           | ✅                                         |
| [t4](./tests/t4.sh) | current stern amd64 image    | ✅                               | ✅                                                  | ✅                                                           | ✅                                         |

## Setups

* M1 Mac Setups (on a MacBook Pro (16", 2021), Chip: `Apple M1 Pro`)
  * [colima on m1](./setups/colima-m1.md)
  * [docker-desktop on m1](./setups/docker-desktop-m1.md)
* Intel Mac Setups (on a MacBook Pro (16", 2019), Chip: `Intel Core i9`)
  * [docker-desktop on intel](./setups/docker-desktop-intel.md)
* Non Mac Setup (for comparison on Ubuntu x86_64):
  * [ubuntu-amd64](./setups/ubuntu-amd64.md)

## License

This work is copyright by DracoBlue (http://dracoblue.net) and licensed under the terms of MIT License.