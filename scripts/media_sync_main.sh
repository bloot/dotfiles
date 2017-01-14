#!/bin/sh

source ./media_sync.sh

sync_media() {
  if [ -z ${REMOTE_SERVER+a} ]; then
    echo "Set remote server in order to sync"
  else
    rsync -vhHE --progress -e "ssh -c blowfish" "$REMOTE_SERVER:$EXTERNAL_MEDIA_DIR" "~/Music/Tagged Library" 2> /tmp/media_sync.log
  fi
}

tag_media() {
  if ! crontab -l | grep -q "beet import" ; then
    crontab -l | sed -i '1 i\*/10 * * * * beet import "$EXTERNAL_MEDIA_DIR"' | crontab -
  fi
}
