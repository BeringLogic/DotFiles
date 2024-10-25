#!/bin/bash
sleep 5
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/$DISPLAY xwd -root -out lightdm.screenshot.xwd
