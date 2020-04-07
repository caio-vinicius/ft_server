#!/bin/bash

grep autoindex -F ft_server | grep off > .off
grep autoindex -F ft_server | grep on > .on

if [[ $AUTOINDEX = "on" ]]; then
	if [[ -s .on ]]; then
		echo "Autoindex is already on"
	else
		sed -i 's/autoindex off;/autoindex on;/g' ft_server
		echo "Autoindex on"
	fi
elif [[ $AUTOINDEX = "off" ]]; then
	if [[ -s .off ]]; then
		echo "Autoindex is already off"
	else	
		sed -i 's/autoindex on;/autoindex off;/g' ft_server
		echo "Autoindex off"
	fi
else
	echo "Something went wrong"
fi

rm -f .off .on
