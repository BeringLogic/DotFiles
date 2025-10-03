#!/bin/bash

#
# Choose a different wallpaper
#

WALLPAPER_FOLDER="$HOME/Images/Wallpapers"
WP_COUNT=$(ls -1 $WALLPAPER_FOLDER | wc -l)
CURRENT="$(swww query | cut -d : -f 5 | sed -e 's/^ *//')"

if [ $WP_COUNT -lt 2 ]; then
  # quickly exit if the only file in the folder has been analyzed by wal
  [ "$(cat ~/.cache/wal/wal)" == "$(find "$WALLPAPER_FOLDER" -follow -maxdepth 1 -type f -o -type l)" ] && exit 0

  # make sure that we don't get into an infinite loop
  CURRENT=""
fi

NEW="$CURRENT"
while [ "$NEW" == "$CURRENT" ]; do
  NEW="$(find "$WALLPAPER_FOLDER" -follow -maxdepth 1 -type f -o -type l | shuf -n 1)"
done

wal --cols16 -i "$NEW"

