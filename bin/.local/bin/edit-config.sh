#!/bin/bash

cd ~/.config
selection=$(fd -L . | fzf)

if [ -n "$selection" ]; then
  nvim "$selection"
fi

