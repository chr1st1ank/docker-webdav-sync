#!/bin/sh
if [ "$(ls /Folder_Local/EXT 2>/dev/null)" ]; then
echo "#### Files ready to sync ####"
echo $(rsync -ravu --exclude={".*/","lost+found"} --ignore-existing "/Folder_Local/" "/Folder_Remote/")
fi

if [ "$(ls /Folder_Remote/EXT 2>/dev/null)" ]; then
echo "#### Files ready to sync ####"
echo $(rsync -ravu --exclude={".*/","lost+found"} --ignore-existing "/Folder_Remote/" "/Folder_Local/")
fi

