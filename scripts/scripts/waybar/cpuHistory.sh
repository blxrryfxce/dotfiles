#!/bin/bash

sampleSize=10
levels=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
historyFile="/tmp/cpu_history"

# get current usage
usage=$(~/.config/scripts/waybar/getCpuUsage.sh)

# load previous history
if [[ -f $historyFile ]]; then
    read -r history < "$historyFile"
else
    history=""
fi

# prepend newest usage as a bar
index=$((usage / 12))
[[ $index -gt 7 ]] && index=7
bar="${levels[$index]}"
history="$bar$history"

history="${history:0:$sampleSize}"

echo "$history" > "$historyFile"

tooltip="[ $history ] $usage%"
text="  $usage%"
echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\"}"