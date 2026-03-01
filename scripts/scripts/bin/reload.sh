#!/bin/bash
getCurrentWallpaper=$(~/.config/scripts/bin/getWallpaper.sh);
if pgrep -x waybar >/dev/null; then
    pkill waybar
else 
    waybar
fi

sh -c "wallust run ${getCurrentWallpaper}"
bash ~/.config/wallust/templates/fastfetch-colors.sh;

echo ${getCurrentWallpaper}
