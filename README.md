# dockerized-qemu

This is a docker container for running x86_64 vms with qemu and connecting to them via ssh inside a container.

## usage

Build docker image:

```
$ docker build -t qemu .
```

Run docker container:

```
$ docker run --rm -it --privileged \
  -v path/to/image/image.img:/qemu/image.img \
  -e RAM=<ram_size> -e HOSTNAME='<hostname>' qemu
```

Logout:

```
$ exit
```
