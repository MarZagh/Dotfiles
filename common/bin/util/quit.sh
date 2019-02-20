#!/bin/bash

if pgrep bspwm; then
    bspc quit
elif pgrep i3; then
    i3-msg exit
else
    :
fi
