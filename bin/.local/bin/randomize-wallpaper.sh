#!/bin/bash

wal -i "$(find ~/Images/Wallpapers -follow -maxdepth 1 -type f | shuf -n 1)"

