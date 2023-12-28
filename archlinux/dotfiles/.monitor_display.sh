#!/usr/bin/sh

xrandr --output HDMI-1 --off --output eDP-1 --auto

function configure_displays() {

	sleep 2
    if xrandr --query | grep -q "HDMI-1 connected"; then
        xrandr --output eDP-1 --primary
        xrandr --output HDMI-1 --auto --right-of eDP-1
        $HOME/.fehbg
		i3 restart
    else
        xrandr --output eDP-1 --primary
        xrandr --output HDMI-1 --off
        $HOME/.fehbg
		i3 restart
    fi
}

configure_displays&

#function main() {
#	
#	notify-send "lol"
#    xrandr --output eDP-1 --primary
#    if xrandr --query | grep "HDMI-1 connected"; then
#        #xrandr --output HDMI-1 --auto --right-of eDP-1
#		xrandr --output HDMI-1 --mode 2048x1152 --left-of eDP-1
#		$HOME/.fehbg
#		#conky -c $HOME/.config/conky/cyber-theme/config_monitor.conf &> /dev/null &
#    fi
#}
#
#main
