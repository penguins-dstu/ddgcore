# DDG Core
A platform Yocto/OpenEmbedded project for building Linux-based customizable distributions for different architectures.

# Layers used
 - [`openembedded-core`](https://github.com/openembedded/openembedded-core) is a basic layer that contains core metadata and provides only emulated machine support.
 - `meta-ddgcore`
 - [`meta-yocto-bsp`](https://git.yoctoproject.org/meta-yocto/tree/meta-yocto-bsp) is used to support generic x86, x86-64 and some other architectures.

# meta-ddgcore
`meta-ddgcore` layer provides a distribution with recipes and basic settings (metadata, packages, etc.; see conf/distro/ddgcore.conf).

# Quick Start

## Setup build environment

Run the following commands to set up the build environment:

    $ git clone -b kirkstone https://github.com/penguins-dstu/ddgcore.git ddgcore
    $ cd ddgcore
    $ source ./scripts/setup.sh

`setup.sh` script copies configuration templates, initializes git submodules and runs the main `oe-init-build-env` script from OpenEmbedded Core.

## Configure target images

For example, the target architecture for image can be specified by setting `MACHINE` variable in `build/conf/local.conf`.
In local.conf you can also define your desired output image types, wic kickstart file, machine hostname, user settings, package classes, etc.

## Build

The Linux kernel, filesystems and images can be built using the BitBake tool.

    $ bitbake -v core-image-minimal

## Run

After boot, you can login as `root` or `admin` with password `1234` (by default).

# Notes about using wic

Also you can use wic tool to manipulate an existing image. For example, it's possible to examine partitions, remove and add some files in image (e.g. the rebuilt kernel).

# Links

More info about The Yocto Project: https://docs.yoctoproject.org/singleindex.html
