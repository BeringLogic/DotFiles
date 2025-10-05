#!/bin/bash

#
# Choose a wallpaper
#

WALLPAPER_FOLDER="$HOME/Images/Wallpapers"

randomize() {
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

  echo "$NEW"
}

case "$1" in
  "")
    SELECTION="$(randomize)"
    ;;
  "--pick")
    SELECTION_FILE="$(mktemp)"
    spf --chooser-file "$SELECTION_FILE" "$WALLPAPER_FOLDER"
    SELECTION="$(cat "$SELECTION_FILE")"
    ;;
  *)
    SELECTION="$1"
    ;;
esac

wal --cols16 -i "$SELECTION"
pywal-colors-niri.sh

notify-send "$(basename "$SELECTION")"

