![Docker-JDownloader](https://raw.githubusercontent.com/MephistoXoL/Docker-WebDav_Sync/master/WebDav_Sync.png)

# Docker-WebDav_Sync
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
```
version: '3.2'
services:
  app:
    container_name: Sync_WebDav
    image: mephistoxol/webdav_sync
    restart: unless-stopped
    env:
      - REMOTE_WEBDAV="Your Remote WebDav Folder"
      - LOCAL_WEBDAV="Your Local WebDav Folder"
      - REMOTE_USER="webdav remote user"
      - REMOTE_PASSWORD="webdav remote password" 
      - LOCAL_USER="webdav local user"
      - LOCAL_PASSWORD="webdav local user"
      - EXTENSION="file extension"
    # Traefik v1.7 optional
    labels:
      - traefik.enable: "False"   
    networks:      
      - internal-network

```

Ansible:
```
      docker_container:
        name: Sync_WebDav
        image: mephistoxol/webdav_sync
        env:
          REMOTE_WEBDAV="Your Remote WebDav Folder"
          LOCAL_WEBDAV="Your Local WebDav Folder"
          REMOTE_USER="webdav remote user"
          REMOTE_PASSWORD="webdav remote password" 
          LOCAL_USER="webdav local user"
          LOCAL_PASSWORD="webdav local user"
          EXTENSION="file extension"
        restart_policy: unless-stopped
        # Traefik v1.7 optional
        labels:
          ttraefik.enable: "False" 
        networks:
          - name: internal-network
      register: result
```

## Changelog
```
13-11-2019
- Initial Release
```

## Donate
[![Paypal](https://raw.githubusercontent.com/MephistoXoL/Things/master/paypal.png)](https://www.paypal.me/mephistoxol)

