#!/bin/sh

source ./media_sync.sh

if ! crontab -l | grep -q "rsync -a" ; then
  crontab -l | sed -i '1 i\*/5 * * * * rsync -a "$LOCAL_MEDIA_DIR" "$EXTERNAL_MEDIA_DIR"' | crontab -
fi
