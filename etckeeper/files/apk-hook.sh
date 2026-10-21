#!/bin/sh

if [ "$1" = "pre-commit" ]; then
    /usr/bin/etckeeper pre-install

elif [ "$1" = "post-commit" ]; then
    /usr/bin/etckeeper post-install
fi
