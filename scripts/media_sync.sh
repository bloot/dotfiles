#!/bin/sh

# Figure out syncing. I want to have rsync running a sync from the laptop to the external drive.
# Once the music is on the external drive I will want to run a beets import from my normal laptop
# to sync music from the Library folder to Tagged Music and then copy media from Tagged Music into
# a directory on my local machine.

LOCAL_MEDIA_DIR="~/Torrents/"
EXTERNAL_MEDIA_DIR="/Volumes/STORE/Library - Read Only/"

function sync_from_seeder() {
  rsync -a "$LOCAL_MEDIA_DIR" "$EXTERNAL_MEDIA_DIR"
}

function sync_from_main_box() {
  beet import "$EXTERNAL_MEDIA_DIR"
}
