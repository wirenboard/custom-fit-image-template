#!/usr/bin/env bash

set -e

BOARD="$1"
RELEASE="$2"
WB_RELEASE="$3"
ADDITIONAL_REPOS="$4"

FIT_CUSTOM_PREFIX='myprefix'

if [ $# -lt 3 ]; then
    echo "Usage: ./build.sh <board> <release> <wb-release> <additional-repos>"
    echo "Example: ./build.sh 7x bullseye stable"
    exit 1
fi

if [ -d "wirenboard" ]; then
    pushd wirenboard/output
    ../wbdev root find . -maxdepth 1 -mindepth 1 -type d -exec rm -rf '{}' \;
    popd
    pushd wirenboard
    git pull
    popd
else
    git clone https://github.com/wirenboard/wirenboard.git
fi

# Create rootfs

cp -f additional.sh wirenboard/additional.sh
pushd wirenboard/rootfs
../wbdev root bash -c \
  "DEBIAN_RELEASE=$RELEASE WB_RELEASE=$WB_RELEASE ADDITIONAL_SCRIPT=../additional.sh ./create_rootfs.sh $BOARD $ADDITIONAL_REPOS"
popd

# Build FIT image

pushd wirenboard/image
../wbdev root bash -c \
  "FIT_CUSTOM_PREFIX=$FIT_CUSTOM_PREFIX ./create_images.sh $BOARD"
popd
