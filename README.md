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
| SYNC_MODE | Limit the sync direction: upload, download, both |

** Extension Files can be set by this variable, leave empty for all files

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
      - SYNC_MODE="upload" 
    volumes:
      # Mount a local folder
      - /opt/data:/local
```
