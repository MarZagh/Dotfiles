#! /bin/sh

WM="bspwm"

# check if window manager is running:
pgrep $WM > /dev/null || exit 0

# monitor names specific to my setup. may vary
INTERNAL="LVDS-1"
EXTERNAL="VGA-1"

monitor_add() {
    bspc desktop

}

monitor_remove() {
    bspc monitor $EXTERNAL -a Desktop > /dev/null
    for $desktop in {1..4} # Put in here the names of your desktops TODO: Automate that process
        bspc desktop $desktop --to-monitor "$INTERNAL"

