#!/usr/bin/env bash

wallpaper=$(awk -F= '/^\s*wallpaper\s*=/{print $2}' ~/.config/waypaper/config.ini | xargs)

echo "$wallpaper"
