# docker-WebDav-sync
Multi Arch to Sync 2 WebDav Folders Bidirectionaly

## Environment Variables
You can add ```EXTENSION``` env. variable to sync only one type of files. 

| Env. Variable | Description |
| --- | --- |
| REMOTE_WEBDAV| Your Remote WebDav Folder |
| LOCAL_WEBDAV| Your Local WebDav Folder |
| REMOTE_USER| webdav remote user |
| REMOTE_PASSWORD| webdav remote password |
| LOCAL_USER| webdav local user |
| LOCAL_PASSWORD| webdav local user |
| EXTENSION**| file extension |
| SYNC_MODE | Limit the sync direction: "mirror" or "two-way-sync"|

** Extension Files can be set by this variable, leave empty for all files

Sync modes:
- mirror: Keeps the remote as exact copy of the local folder. Locally deleted files are also deleted on the remote. Remote changes are overwritten
- two-way-syn: Missing files in both folders are copied to the other folders. Note: Deletions in only one folder are undone by the synchronization.

## Install
Command line:
```
 docker run --name=Sync_WebDav --privileged --cap-add=ALL \
 -e REMOTE_WEBDAV="Your Remote WebDav Folder" \
 -e LOCAL_WEBDAV="Your Local WebDav Folder" \
 -e REMOTE_USER="webdav remote user" \
 -e REMOTE_PASSWORD="webdav remote password" \
 -e LOCAL_USER="webdav local user" \
 -e LOCAL_PASSWORD="webdav local user" \
 -e EXTENSION="file extension" \
 mephistoxol/webdav_sync
```

Docker Compose:
```docker-compose
version: '2.4'
services:
  webdav-sync:
    container_name: webdav-sync
    build:
      context: https://github.com/chr1st1ank/docker-webdav-sync.git
    image: docker-webdav-sync
    restart: unless-stopped
    environment:
      - REMOTE_WEBDAV="Your Remote WebDav Folder"
      - REMOTE_USER="webdav remote user"
      - REMOTE_PASSWORD="webdav remote password" 
      # - LOCAL_WEBDAV="Your Local WebDav Folder"
      # - LOCAL_USER="webdav local user"
      # - LOCAL_PASSWORD="webdav local user"
      # - EXTENSION="file extension"
      - SYNC_MODE="mirror" 
    volumes:
      # Mount a local folder
      - /opt/data:/local:ro
```
