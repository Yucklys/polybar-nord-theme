#!/bin/sh

# this requires a service for clash at /usr/lib/systemd/system
service=$(systemctl is-active --user clash)


case $1 in
	"toggle")
		if [ $service == 'active' ]
		then
			systemctl stop --user clash
			printf '%s' '%{F#4c566a}%{F-}'
		else
			systemctl start --user clash
			printf '%s' '%{F#a3be8c}%{F-}'
		fi
		;;
	"")
		if [ $service == "active" ]
		then
			printf '%s' '%{F#a3be8c}%{F-}'
		else
			printf '%s' '%{F#4c566a}%{F-}'
		fi
esac
		
