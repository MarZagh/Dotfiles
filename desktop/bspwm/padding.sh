#!/bin/sh

for setting in {"right","left","bottom"}
do
    bspc config "$setting"_padding $1
done
bspc config top_padding $(($1 + 27 + 24))
