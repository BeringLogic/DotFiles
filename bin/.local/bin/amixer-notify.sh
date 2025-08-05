#!/bin/bash

case "$1" in
    inc)
        amixer -D pulse -q sset Master 5%+ unmute
        ;;
    dec)
        amixer -D pulse -q sset Master 5%- unmute
        ;;
    mute | toggle)
        amixer -D pulse -q sset Master toggle
        ;;
    *)
        echo "USAGE: $0 [command]"
        echo ""
        echo "Available commands:"
        echo "  inc"
        echo "  dec"
        echo "  mute"
        echo "  toggle"
        exit
        ;;
esac


AMIXER=$(amixer -D pulse sget Master)
VOLUME=$(echo $AMIXER | grep 'Right:' | awk -F'[][]' '{ print $2 }' | tr -d "%")
MUTE=$(echo $AMIXER | grep -o '\[off\]' | tail -n 1)
if [ "$VOLUME" -le 20 ]; then
    ICON=audio-volume-low
else if [ "$VOLUME" -le 60 ]; then
         ICON=audio-volume-medium
     else 
         ICON=audio-volume-high
     fi
fi
if [ "$MUTE" == "[off]" ]; then
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

echo $(notify-send "Volume" \
                   "$VOLUME/100" \
                   --hint string:image-path:$ICON \
                   --hint int:has-percentage:$VOLUME \
                   --app-name "$SCRIPT_NAME" \
                   --transient \
                   --print-id \
                   --replace-id $VOLUME_NOTIFICATION_ID) > "$TEMP_FILE"
