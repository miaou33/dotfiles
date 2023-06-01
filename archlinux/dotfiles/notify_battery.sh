#!/bin/bash
battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
if [ $battery_level -le 15 ]; then
    dunstify -u critical "Alerte rouge" "Batterie : ${battery_level}%"
fi

