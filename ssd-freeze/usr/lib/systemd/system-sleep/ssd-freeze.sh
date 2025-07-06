#!/bin/sh
if [ "$1" = 'post' ]; then
	sleep 1
	if hdparm --security-freeze /dev/disk/by-id/ata-WDC_WDS500G2B0B-00YS70_204442803773; then
		logger "$0: SSD freeze command executed successfully"
	else
		logger "$0: SSD freeze command failed"
	fi	
fi
