#!/usr/bin/sh

# The xRandR names of my monitors, including the internal laptop monitor / display
readonly MON_INTERNAL='eDP-1'
readonly MON1='HDMI-1'

# The resolutiond of the given xRandR monitors / displays. NOTE: $MON1 and $MON1_FALLBACK are the same display, so only one res is needed
# readonly MON_INTERNAL_RES='2560x1600'
# readonly MON1_RES='1920x1080'

# main_mon=''
# sec_mon=''

# Store a count of how many monitors are connected
#mon_count=$(xrandr -q | grep -w 'connected' | wc -l)

# Configure the monitors via xRandR
config_monitors() {
    xrandr --output $MON_INTERNAL --primary
    if [ "$#" -eq "2" ]; then
        xrandr --output $MON1 --auto --right-of $MON_INTERNAL
    fi
}
