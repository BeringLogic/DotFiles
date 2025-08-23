#!/bin/bash

cd ~/.config
selection=$(fd -L . | fzf)

if [ -n "$selection" ]; then
  nvim "$selection"
fi

[[ "$selection" == "waybar"* ]] && systemctl --user restart waybar
[[ "$selection" == "swaync"* ]] && systemctl --user restart swaync

