#!/usr/bin/bash

cd ~/Documents/Notes/

SELECTION="$(fd . | fzf)"
[[ -n "$SELECTION" ]] && nvim "$SELECTION"
