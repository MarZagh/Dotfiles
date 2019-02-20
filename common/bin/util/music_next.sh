#!/bin/sh

pgrep -u $UID -x spotify >/dev/null && playerctl next
mpc status && mpc next
