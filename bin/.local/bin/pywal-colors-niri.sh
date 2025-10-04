#!/usr/bin/env bash

WAL_COLORS_FILE="$HOME/.cache/wal/colors"
NIRI_CONFIG_FILE="$HOME/.config/niri/config.kdl"

echo "reading $WAL_COLORS_FILE"
COLOR_ACTIVE="$(cat "$WAL_COLORS_FILE" | sed '10!d')"
COLOR_INACTIVE="$(cat "$WAL_COLORS_FILE" | sed '2!d')"
COLOR_BACKDROP="$(cat "$WAL_COLORS_FILE" | sed '2!d')"

echo "> active-color: $COLOR_ACTIVE"
echo "> inactive-color: $COLOR_INACTIVE"
echo "> backdrop-color: $COLOR_BACKDROP"

echo "editing $NIRI_CONFIG_FILE"
sed \
  -i \
  -e "s/\(^\s*active-color\s*\"\)\(#......\)\"/\1$COLOR_ACTIVE\"/g" \
  -e "s/\(^\s*inactive-color\s*\"\)\(#......\)\"/\1$COLOR_INACTIVE\"/g" \
  -e "s/\(^\s*backdrop-color\s*\"\)\(#......\)\"/\1$COLOR_BACKDROP\"/g" \
  "$NIRI_CONFIG_FILE"

