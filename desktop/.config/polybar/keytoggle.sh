#!/bin/bash

LANG1="us"
LANG2="de"
CURRENT_LANG=$(setxkbmap -query | grep "layout" | cut -f6 -d ' ')
if [ "$CURRENT_LANG" = $LANG1 ]; then
    setxkbmap $LANG2
else
    setxkbmap $LANG1 -variant altgr-intl
fi
