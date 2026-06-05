selected=$(find ~/.config/scripts/userscripts -maxdepth 1 -type f -printf "%f\n" | rofi -dmenu -p "Choose script: ");
 ~/.config/scripts/userscripts/"$selected"