#!/bin/bash

if [[ "$1" == "" || "$2" == "" ]]; then
    echo "Usage: ./flatpak-allow-dir.sh path/to/mount full.flatpak.name"
    echo "Args were: $1 $2"
    exit 2
fi

echo "Mounting $1 to $2"

set -x

flatpak override --user --filesystem=$1 $2
