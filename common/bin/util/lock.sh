#!/bin/sh

rm -f /tmp/locked.png

# If `imagemagick` is not installed, use a blank screen.
[ -f /usr/bin/convert ] &&
scrot -m -z /tmp/base.png &&
convert /tmp/base.png -blur 0x8 /tmp/locked.png

# Pause music (mocp, mpd and send the pause key to all mpv videos):
mpc pause
playerctl -p spotify pause

i3lock -e -f -c 000000 -i /tmp/locked.png; 

# In five seconds, turn off display unless key press in last 4 seconds.
sleep 15 && [ 8000 -lt "$(xssstate -i)" ] &&  pgrep -x i3lock && xset dpms force off
