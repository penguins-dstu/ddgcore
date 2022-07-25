#!/bin/sh
if [ -n "$BASH_SOURCE" ]; then
    THIS_SCRIPT=$BASH_SOURCE
elif [ -n "$ZSH_NAME" ]; then
    THIS_SCRIPT=$0
else
    THIS_SCRIPT="$(pwd)/prepare.sh"
    if [ ! -e "$THIS_SCRIPT" ]; then
        echo "Error: $THIS_SCRIPT doesn't exist!" >&2
        exit 1
    fi
fi

if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
    echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'" >&2
    exit 1
fi

if [ ! -e ./openembedded-core/.git ]
then
    echo "Submodules initialization..."
    git submodule init
    git submodule update --init --recursive
    echo "Done."
fi

if [ ! -d ./openembedded-core ]
then
    echo "Please run this script in the top directory of this repo." >&2
    return
fi

if [ ! -z "$1" ]
then
    BUILDDIR="$1"
else
    BUILDDIR=build
fi

if [ ! -d ${BUILDDIR}/conf ]
then
    echo "Creating build/conf directory..."
    mkdir -p ${BUILDDIR}/conf
    echo "Done."
fi

if [ ! -f ${BUILDDIR}/conf/local.conf ]
then
    echo "Copying files from templates/build..."
    cp -rp templates/build/* ${BUILDDIR}/
    echo "Done."
fi

source ./openembedded-core/oe-init-build-env
