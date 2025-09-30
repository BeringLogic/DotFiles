#!/bin/bash

cd ~/.DotFiles
selection=$(fd -L -H . | fzf)

if [ -n "$selection" ]; then
  nvim "$selection"
fi

[[ "$selection" == "waybar"* ]] && systemctl --user restart waybar
[[ "$selection" == "swaync"* ]] && systemctl --user restart swaync

