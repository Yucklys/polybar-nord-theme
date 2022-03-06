#!/bin/bash

set -e 

status=$(mullvad status | cut -d' ' -f3)
condition="Connected"

if [[ $status == $condition ]];
then
	printf   '%s' '%{F#81A1C1}'
else
	printf   '%s' '%{F#BF616A}'
	#Comment out below line to prevent mullvad from auto-connecting
	mullvad connect
fi


