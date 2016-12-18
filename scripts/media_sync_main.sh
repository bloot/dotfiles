#!/bin/sh

source ./media_sync.sh

if ! crontab -l | grep -q "beet import" ; then
  crontab -l | sed -i '1 i\*/10 * * * * beet import "$EXTERNAL_MEDIA_DIR"' | crontab -
fi
