#!/usr/bin/env bash

# Script that is executed after a wal command so that even programs with hardcoded colors use colors from .Xdefaults

source "${HOME}/.cache/wal/colors.sh"

# Change Gradient colors in Cava
sed -i "107s/.*/gradient_color_1 = \"$color1\"/" ~/.config/cava/config
sed -i "108s/.*/gradient_color_2 = \"$color2\"/" ~/.config/cava/config

# Relaunch dunst with colors from .Xdefaults
killall -q dunst
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done

/usr/bin/dunst \
    -lf "${color15:=#000000}" \
    -nf "${color15:=#000000}" \
    -cf "${color0:=#F0F0F0}" \
    -lb "${color0:-#F0F0F0}" \
    -nb "${color0:-#F0F0F0}" \
    -cb "${color15:-#000000}" \
    -lfr "${foreground:-#000000}" \
    -nfr "${foreground:-#000000}" \
    -cfr "${color0:-#000000}" &

disown -h %1
    
notify-send Yay! "Pywal theme changed successfully!"
