#!/bin/sh

# Relaunch dunst with colors from .Xdefaults
killall -q dunst
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done

source ~/.cache/wal/colors.sh

/usr/bin/dunst \
    -lf "${color15:=#000000}" \
    -nf "${color15:=#000000}" \
    -cf "${color0:=#F0F0F0}" \
    -lb "${color0:-#F0F0F0}" \
    -nb "${color0:-#F0F0F0}" \
    -cb "${color15:-#000000}" \
    -lfr "${color8:-#000000}" \
    -nfr "${color8:-#000000}" \
    -cfr "${color0:-#000000}" &

disown -h %1
