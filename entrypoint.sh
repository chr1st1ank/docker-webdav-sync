#!/bin/sh

SYNC_FILE="/usr/bin/Sync_Folders.sh"

# Store Credentials
echo "Storing webdav Credentials"
echo $REMOTE_WEBDAV $REMOTE_USER $REMOTE_PASSWORD >> /etc/davfs2/secrets
echo $LOCAL_WEBDAV $LOCAL_USER $LOCAL_PASSWORD >> /etc/davfs2/secrets

# Mounting WebDav folders
echo "Check mountpoints... "
if [ "$(grep /Folder_Remote /proc/mounts)" ]; then
echo "Already Mounted"
else
echo " -  Mounting /Folder_Remote "
mount -t davfs $REMOTE_WEBDAV /Folder_Remote
echo "    Done..."
fi

if [ "$(grep /Folder_Local /proc/mounts)" ]; then
echo "Already Mounted"
else
echo " -  Mounting /Folder_Local "
mount -t davfs $LOCAL_WEBDAV /Folder_Local
echo "    Done..."
fi

# Add file extension to Sync_Folder
echo "Checking Extension env. variable... "
if [ -z "$EXTENSION" ]; then
echo "  · No extension file applied "
echo "  · Synchronize all files in folders"
sed -i 's,'"EXT"','"*"',' $SYNC_FILE
sed -i 's,'"INCLUDE"','""',' $SYNC_FILE
else
echo "  · Extension file applied "
echo "  · Synchronze only .$EXTENSION files"
sed -i 's,'"EXT"','"*.$EXTENSION"',' $SYNC_FILE
sed -i 's,'"INCLUDE"','"--include=*.$EXTENSION"',' $SYNC_FILE
fi
echo "    Done..."

# Add cronjob
echo "# Adding cronjob and starting..."
echo '*/3 * * * * $SYNC_FILE' >> /var/spool/cron/crontabs/root
echo "    Done... Starting"
crond -l 2 -f
