#!/bin/bash

# read first line from /proc/stat
read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
idleTime=$((idle + iowait))

# file to store previous counters
prevFile="/tmp/cpu_prev"

# if previous counters exist, calculate cpuUsage
if [[ -f $prevFile ]]; then
    read prevTotal prevIdle < $prevFile
    totalDiff=$((total - prevTotal))
    idleDiff=$((idleTime - prevIdle))
    cpuUsage=$((100 * (totalDiff - idleDiff) / totalDiff))
else
    cpuUsage=0  # first run, no previous data
fi
# save current counters for next run
echo "$total $idleTime" > $prevFile

echo ${cpuUsage}