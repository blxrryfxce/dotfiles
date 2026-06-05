#!/bin/bash

# this is for copying something to a new dir. like moving ascii from non active to active
dir="$1"
newDir="$2"
newName="$3"

selected=$(ls "$dir" | rofi -dmenu -p "Pick: ")

echo "Selected: $selected"

if [[ -n "$selected" ]]; then
    cp "$dir/$selected" "$newDir/$newName"
    notify-send "Copied $selected to $newDir/$newName"
else
    notify-send "No file selected"
fi

