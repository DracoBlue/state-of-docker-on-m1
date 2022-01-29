# state-of-docker-on-m1

Since making docker desktop unavailable for free to larger organizations, there are multiple alternatives people might
evaluate. But there is also a difference between Apple M1 and Apple Intel devices. Thus this little repository provides
information of the state of how which setup compares in terms of working.

## Results (on a `MacBook Pro (16", 2021)`)

| Test ID             | Summary                      | [colima](./setups/colima-m1.md)  | [docker-desktop-m1](./setups/docker-desktop-m1.md) |
|---------------------|------------------------------|----------------------------------|---------------------------------------------------|
| [t1](./tests/t1.sh) | trusty openresty amd64 image | 🛑                               | 🛑                                                  |
| [t2](./tests/t2.sh) | alpine openresty amd64 image | ✅                               | ✅                                                  |
| [t3](./tests/t3.sh) | old stern amd64 image        | 🛑                               | 🛑                                                  |
| [t4](./tests/t4.sh) | current stern amd64 image    | ✅                               | ✅                                                  |

## Setups

* [colima on m1](./setups/colima-m1.md)
* [docker-desktop on m1](./setups/docker-desktop-m1.md)

## License

This work is copyright by DracoBlue (http://dracoblue.net) and licensed under the terms of MIT License.