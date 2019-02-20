#!/bin/sh

pgrep -u $UID -x spotify >/dev/null && playerctl play-pause
mpc status && mpc toggle
