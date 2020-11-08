#!/bin/sh
if [[ "$SYNC_MODE" == "mirror" ]]; then
    if [ "$(ls /local/*EXT 2>/dev/null)" ]; then
    echo "#### Files ready to sync ####"
    rsync -ravu --exclude={".*","lost+found"} INCLUDE --ignore-existing --delete "/local/" "/remote/" 2>1
    fi
else
    if [ "$(ls /local/*EXT 2>/dev/null)" ]; then
    echo "#### Files ready to sync ####"
    rsync -ravu --exclude={".*","lost+found"} INCLUDE --ignore-existing "/local/" "/remote/" 2>1
    fi
    if [ "$(ls /remote/*EXT 2>/dev/null)" ]; then
    echo "#### Files ready to sync ####"
    rsync -ravu --exclude={".*","lost+found"} INCLUDE --ignore-existing "/remote/" "/local/" 2>1
    fi
fi
