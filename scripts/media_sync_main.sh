#!/bin/sh

source ./media_sync.sh

sync_media() {
  if [ -z ${REMOTE_SERVER+a} ] || [ -z ${LOCAL_MEDIA_DIR+a} ]; then
    echo "Set media directory vars before running."
  else
    rsync -vaE --progress \
      --include '*/' --include '*.mp3' \
      --exclude '*' "$REMOTE_SERVER:$EXTERNAL_MEDIA_DIR" "$LOCAL_MEDIA_DIR" > /tmp/media_sync.log
  fi
}

tag_media() {
  if ! crontab -l | grep -q "beet import" ; then
    crontab -l | sed -i '1 i\*/10 * * * * beet import "$EXTERNAL_MEDIA_DIR"' | crontab -
  fi
}
