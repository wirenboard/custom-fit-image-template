Build command:
```sh
./build.sh 7x bullseye wb-2310
```

Custom setup injection script should be named `additional.sh` and should be strictly unattended.

Output fit images will be stored in `wirenboard/output/images`.

Requirements:
* Docker
* `apt install qemu-user-static binfmt-support`
* 15 GB of disk space
