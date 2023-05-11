#!/bin/bash

killall conky
sleep 2s
conky -c ~/.config/conky/conky.conkyrc &&

exit 0
