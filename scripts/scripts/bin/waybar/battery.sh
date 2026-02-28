#!/bin/bash

# Automatically find the battery path
BAT=$(ls /sys/class/power_supply/ | grep -E '^BAT')
icons=( "" "" "" "" "" )  # empty → full

capacity=$(cat /sys/class/power_supply/$BAT/capacity)
status=$(cat /sys/class/power_supply/$BAT/status)

if [[ "$status" == "Charging" ]]; then
    # Cycle through icons every second with lightning
    idx=$(( $(date +%s) % ${#icons[@]} ))
    icon="${icons[$idx]} "
else 
    if ((capacity >= 90)); then
        icon=""    # Full
    elif ((capacity >= 70)); then
        icon=""    # 3/4
    elif ((capacity >= 50)); then
        icon=""    # Half
    elif ((capacity >= 30)); then
        icon=""    # 1/4
    elif ((capacity >= 10)); then
        icon=""    # Low
    else
        icon=" " # Critical <10%
    fi
fi

echo "$icon $capacity%"



