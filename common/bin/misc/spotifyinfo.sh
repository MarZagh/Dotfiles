#!/bin/sh

source ~/.cache/wal/colors.sh

artist="$(playerctl -p spotify metadata artist)"
title="$(playerctl -p spotify metadata title)"

if [ "$(playerctl -p spotify status)" = "Playing" ]; then
    #echo %{A1:playerctl -p spotify play-pause:}%{F"$buttoncolor"}%{F-}%{A} "$title" - "$artist"
    #echo %{A1:playerctl -p spotify play-pause:}%{A} "$artist" - "$title"
    echo %{A1:playerctl -p spotify play-pause:}%{A}
else
    echo %{F$color8}%{A1:playerctl -p spotify play-pause:}%{A}%{F-}
fi
