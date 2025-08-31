#!/bin/bash

swww img "$(find ~/Images/Wallpapers -follow -maxdepth 1 -type f | shuf -n 1)"

