FROM alpine

## INSTALL PACKAGES
RUN apk add --update --no-cache bash rsync davfs2

## CREATING STRUCTURE
RUN mkdir /local /remote && \
    touch /etc/davfs2/secrets && \
    chmod 600 /etc/davfs2/secrets

## COPY SCRIPTS
COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY sync-folders.sh /usr/bin/sync-folders.sh

RUN chmod +x /usr/bin/entrypoint.sh /usr/bin/sync-folders.sh

ENTRYPOINT /usr/bin/entrypoint.sh
