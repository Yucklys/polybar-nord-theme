#!/bin/sh

# this requires a service for clipmenu at /usr/lib/systemd/system
service=$(systemctl is-active --user clipmenud)
dmenu_launcher=rofi


case $1 in
	"toggle")
		if [ $service == 'active' ]
		then
			systemctl stop --user clipmenud
			printf '%s' '%{F#4c566a}%{F-}'
		else
			systemctl start --user clipmenud
			printf '%s' '%{F#a3be8c}%{F-}'
		fi
		;;
	"menu")
		if [ $service == 'active' ]
		then
			CM_LAUNCHER=$dmenu_launcher clipmenu 
			printf '%s' '%{F#a3be8c}%{F-}'
		else
			printf '%s' '%{F#4c566a}%{F-}'
		fi
		;;
	"")
		if [ $service == "active" ]
		then
			printf '%s' '%{F#a3be8c}%{F-}'
		else
			printf '%s' '%{F#4c566a}%{F-}'
		fi
esac
		
