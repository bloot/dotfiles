#!/bin/sh

EXTERNAL_MEDIA_DIR="/Volumes/STORE/Library\ -\ Read\ Only"

sync_media() {
  if [ -z ${REMOTE_SERVER+a} ] || [ -z ${LOCAL_MEDIA_DIR+a} ]; then
    printf "\nMedia Directory ENV vars are not set\n\n"
  else
    printf "\nStarting Media Sync\n\n"
    rsync -vaE --progress \
      --include '*/' --include '*.mp3' \
      --exclude '*' "$REMOTE_SERVER:$EXTERNAL_MEDIA_DIR" "$LOCAL_MEDIA_DIR" > /tmp/media_sync.log
    printf "\nMedia Sync Complete\n\n"
    find "$HOME/Downloads/temp_dir" -name "*.torrent" -delete
  fi
}

tag_media() {
  if ! crontab -l | grep -q "beet import" ; then
    echo "Creating cron job for Beets"
    crontab -l | sed -i '1 i\*/10 * * * * beet import "$LOCAL_MEDIA_DIR"' | crontab -
  else
    echo "Cron job for Beets already created."
  fi
}

