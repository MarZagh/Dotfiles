#!/bin/sh

pgrep -u $UID -x spotify >/dev/null && playerctl previous
mpc status && mpc prev
