#!/bin/bash

# Automatically find the battery path
BAT=$(ls /sys/class/power_supply/ | grep -E '^BAT')
icons=( "" "" "" "" "" )  # empty → full

capacity=$(cat /sys/class/power_supply/$BAT/capacity)
status=$(cat /sys/class/power_supply/$BAT/status)

if [[ "$status" != "Discharging" ]]; then
  # date +%s is seconds, modulus with x amount of icons.
  # 1 % 5 = 1, 2 % 5 = 2 etc. choosing that icon.
  idx=$(( $(date +%s) % ${#icons[@]} ))
  icon="${icons[$idx]} "
else 
  if ((capacity <= 5)); then
      icon=" "  # Critical
  elif ((capacity <= 30)); then
      icon=""     # 1/4
  elif ((capacity <= 50)); then
      icon=""     # 1/2
  elif ((capacity <= 80)); then
      icon=""     # 3/4
  else
      icon=""     # Full
  fi
fi

echo "$icon $capacity%"



