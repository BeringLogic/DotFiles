#!/bin/bash

function synthax {
	echo "Synthax: `basename $0` <command> [app name]"
	echo ""
	echo "Available commands:"
	echo -e "\tauth"
	echo -e "\tlist-games"
	echo -e "\tinstall <app name>"
	echo -e "\tlaunch <app name>"
	echo -e "\tsync-saves <app name>"
	echo -e "\t-- <something>\t\twill call: legendary <something>"
}

if [ $# -eq 0 ]; then
	synthax
	exit
fi

INSTALL_DIR=`grep install_dir ~/.config/legendary/config.ini | sed -e "s/install_dir[ ]*=[ ]*//"`
if [ -z "$INSTALL_DIR" ]; then
	INSTALL_DIR="~/legendary"
fi

case "$1" in
	install|launch|sync-saves)
		if [ -z "$2" ]; then
			echo "You need to specify the app name"
			exit 1
		fi
		;;
esac

case "$1" in
	--help|-h)
		synthax
		;;
	# simple commands
	auth|list-games)
		legendary $*
		;;
	install)
		legendary install $2
		mkdir -p "$INSTALL_DIR/Prefixes/$2" &> /dev/null
		;;
	launch)
		STEAM_COMPAT_DATA_PATH="$INSTALL_DIR/Prefixes/$2" STEAM_COMPAT_CLIENT_INSTALL_PATH="$HOME/.steam/steam" legendary launch $2 --wrapper '"/home/phil/.steam/steam/steamapps/common/Proton - Experimental/proton" run' --no-wine
		;;
	sync-saves)
		legendary sync-saves $2 --save-path "$INSTALL_DIR/CloudSaves/$2"
		;;
	# just throw everything at legendary, in case you want to do some voodoo
	--)
		shift
		legendary $*
		;;
	*)
		echo "Command not supported. You will have to use legendary directly."
		;;
esac
