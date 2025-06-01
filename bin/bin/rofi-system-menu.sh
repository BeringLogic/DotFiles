#!/bin/bash

lock=' Lock'
suspend='󰒲 Suspend'
logout='󰍃 Logout'
reboot='󰑓 Reboot'
shutdown=' Shutdown'

answer=$(echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi -dmenu -i -p "System menu" -theme-str 'window { width: 500px; }' -no-fixed-num-lines 5)

case "$answer" in
  "$lock")
    loginctl lock-session
    ;;
  "$suspend")
    systemctl suspend
    ;;
  "$logout")
    niri msg action quit
    ;;
  "$reboot")
    systemctl reboot
    ;;
  "$shutdown")
    systemctl poweroff
    ;;
esac

