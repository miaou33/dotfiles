#!/bin/bash

#killall conky
sleep 2s
		
conky -c $HOME/.config/conky/cyber-theme/config_laptop.conf &> /dev/null &
