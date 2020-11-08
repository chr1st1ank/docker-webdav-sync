#!/bin/sh
if [ $SYNC_MODE -ne "download" ]; then
    if [ "$(ls /local/EXT 2>/dev/null)" ]; then
    echo "#### Files ready to sync ####"
    echo $(rsync -ravu --exclude={".*","lost+found"} INCLUDE --ignore-existing "/local/" "/remote/")
    fi
fi

if [ $SYNC_MODE -ne "upload" ]; then
    if [ "$(ls /remote/EXT 2>/dev/null)" ]; then
    echo "#### Files ready to sync ####"
    echo $(rsync -ravu --exclude={".*","lost+found"} INCLUDE --ignore-existing "/remote/" "/local/")
    fi
fi
