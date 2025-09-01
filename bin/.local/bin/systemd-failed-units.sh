#!/usr/bin/env bash

echo -e "\e[34m SYSTEM UNITS:\e[0m"
PAGER="" systemctl --failed

echo
echo -e "\e[34m USER UNITS:\e[0m"
PAGER="" systemctl --user --failed

echo
read -n 1 -s -p $'\e[34mPress any key to quit...\e[0m'
