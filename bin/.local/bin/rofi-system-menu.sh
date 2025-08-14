#!/bin/bash

monitorOff='󱗤 Monitor Off'
lock=' Lock'
suspend='󰒲 Suspend'
exit='󰍃 Exit'
reboot='󰑓 Reboot'
halt=' Halt'

answer=$(echo -e "$monitorOff\n$lock\n$suspend\n$exit\n$reboot\n$halt" | rofi -dmenu -i -p "System menu" -theme-str 'window { width: 500px; }' -no-fixed-num-lines 5)

case "$answer" in
  "$monitorOff")
    niri msg action power-off-monitors
    ;;
  "$lock")
    loginctl lock-session
    ;;
  "$suspend")
    systemctl suspend
    ;;
  "$exit")
    niri msg action quit --skip-confirmation
    ;;
  "$reboot")
    systemctl reboot
    ;;
  "$halt")
    systemctl poweroff
    ;;
esac

