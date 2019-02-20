#!/bin/sh

pgrep -u $UID -x spotify >/dev/null && playerctl stop 
mpc status && mpc stop
