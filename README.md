Build command:
```sh
./build.sh 7x bullseye stable
```

Custom setup injection script should be named `additional.sh` and should be strictly unattended.

Output fit images will be stored in `wirenboard/output/images`.

Prerequisites:
* Host system: Debian/Ubuntu or derivatives
* [Docker](https://docs.docker.com/engine/install/)
* `apt install qemu-user-static binfmt-support`
* 15 GB of disk space
