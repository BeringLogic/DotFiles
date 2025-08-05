#!/bin/bash

case "$1" in
  +)
    VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print $2 * 100 }')
    if [ "$VOLUME" -lt 100 ]; then
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    fi
    ;;
  -)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    ;;
  mute | toggle)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
  *)
    echo "USAGE: $0 [command]"
    echo ""
    echo "Available commands:"
    echo "  +"
    echo "  -"
    echo "  mute"
    echo "  toggle"
    exit
    ;;
esac

WPCTL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOLUME=$(echo "$WPCTL" | awk '{ print $2 * 100 }')
MUTED=$(echo "$WPCTL" | grep -c '\[MUTED\]')
if [ "$VOLUME" == 0 ]; then
  ICON=audio-volume-muted
elif [ "$VOLUME" -le 20 ]; then
  ICON=audio-volume-low
elif [ "$VOLUME" -le 60 ]; then
  ICON=audio-volume-medium
else
  ICON=audio-volume-high
fi

if [ "$MUTED" == "1" ]; then
  ICON=audio-volume-muted
fi 

SCRIPT_NAME="$0" 
SCRIPT_NAME="${SCRIPT_NAME##*/}" # extract the script's name
SCRIPT_NAME="${SCRIPT_NAME%.*}"  # without extension
SCRIPT_NAME="${SCRIPT_NAME^^}"   # in uppercase

TEMP_FILE="/tmp/${SCRIPT_NAME}_NOTIFICATION_ID"

if [[ -f "$TEMP_FILE" ]]; then
  VOLUME_NOTIFICATION_ID=$(cat "$TEMP_FILE")
  if [[ -z "$VOLUME_NOTIFICATION_ID" ]]; then
    VOLUME_NOTIFICATION_ID=0
  fi
else
  VOLUME_NOTIFICATION_ID=0
fi

notify-send "Volume" \
  "$VOLUME" \
  --hint string:image-path:$ICON \
  --hint int:value:$VOLUME \
  --app-name "$SCRIPT_NAME" \
  --transient \
  --print-id \
  --replace-id $VOLUME_NOTIFICATION_ID > "$TEMP_FILE"
