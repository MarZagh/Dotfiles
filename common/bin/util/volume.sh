#!/bin/bash

# Raise the volume 5 %

function getProgressString {
ITEMS="$1" # The total number of items(the width of the bar)
FILLED_ITEM="$2" # The look of a filled item
NOT_FILLED_ITEM="$3" # The look of a not filled item
STATUS="$4" # The current progress status in percent

# calculate how many items need to be filled and not filled
FILLED_ITEMS=$(echo "((${ITEMS} * ${STATUS})/100 + 0.5) / 1" | bc)
NOT_FILLED_ITEMS=$(echo "$ITEMS - $FILLED_ITEMS" | bc)

# Assemble the bar string
msg=$(printf "%${FILLED_ITEMS}s" | sed "s| |${FILLED_ITEM}|g")
msg=${msg}$(printf "%${NOT_FILLED_ITEMS}s" | sed "s| |${NOT_FILLED_ITEM}|g")
echo "$msg"
}

# Arbitrary but unique message id
msgId="991049"

amixer set Master "$@" >/dev/null

 # Query amixer for the current volume and whether or not the speaker is muted
 volume="$(amixer get Master | tail -1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
 mute="$(amixer get Master | tail -1 | awk '{print $6}' | sed 's/[^a-z]*//g')"
 if [[ $volume == 0 || "$mute" == "off" ]]; then
     # Show the sound muted notification
     dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "Volume muted: ${volume}%"
 elif (( $volume <=33 )); then
     dunstify -a "changeVolume" -u low -i audio-volume-low -r "$msgId" \
     "Volume: ${volume}%" 
 elif (( $volume <=67 )); then
     dunstify -a "changeVolume" -u low -i audio-volume-medium -r "$msgId" \
     "Volume: ${volume}%" 
 else
     # Show the volume notification
     dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" \
     "Volume: ${volume}%" 
 fi
