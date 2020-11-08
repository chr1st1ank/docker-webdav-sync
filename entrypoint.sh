#!/bin/sh

SYNC_FILE="/usr/bin/sync-folders.sh"

# Store Credentials
echo "Storing webdav Credentials"
echo $REMOTE_WEBDAV $REMOTE_USER $REMOTE_PASSWORD >> /etc/davfs2/secrets
echo $LOCAL_WEBDAV $LOCAL_USER $LOCAL_PASSWORD >> /etc/davfs2/secrets

# Mounting WebDav folders
echo "Check mountpoints... "
if [ "$(grep /remote /proc/mounts)" ]; then
    echo "Already Mounted"
elif [ -n "$REMOTE_WEBDAV" ]; then
    echo " -  Mounting /remote "
    mount -t davfs $REMOTE_WEBDAV /remote
    echo "    Done..."
fi

if [ "$(grep /local /proc/mounts)" ]; then
    echo "Already Mounted"
elif [ -n "$LOCAL_WEBDAV" ]; then
    echo " -  Mounting /local "
    mount -t davfs $LOCAL_WEBDAV /local
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
echo "Adding cronjob and starting..."
echo '*/3 * * * * $SYNC_FILE' >> /var/spool/cron/crontabs/root
echo "    Done... Starting"
crond -l 2 -f
