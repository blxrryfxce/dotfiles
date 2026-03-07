# my dotfiles.

The rice focuses primarily on the aesthetics while keeping good functionality. I'm a beginner ricer and very busy therefore this isn't maintned nor made in the best way possible. But feel free to steal something or take inspiration!

The only reason this exists is so that i can go back if i fuck up something.

Everything is symlinked using gnu-stow and points to ~/.config

---

## Terminal

- **Alacritty** - spawns as a floating window with custom ASCII art, binded to `SUPER + ENTER`

---

## Window Manager
- **Hyprland** - tiling window manager  
- **Waybar** - status bar binded to `SUPER + W`

---
## Application Viewer

- **Rofi** binded to `SUPER + E`

---
## File Manager

- **Thunar** - lightweight alternative  

---

## Wallpaper & themes
- **Wallust** - fetches wallpapers & color palettes  
- **swaybg** - wallpaper backend  
- **waypaper** - wallpaper frontend binded to `SUPER + P`

---

## Web Browser

- **Firefox**  - binded to `SUPER + S`

---

## Utilities

- **Btop** - system monitor binded to `SUPER + B`

---

## Scripts
- **Battery script** - tracks battery level (used in status bar)  
- **Zoom** - zoom in/out using `SUPER + numpad (+/-)`  
- **getWallpaper** - fetches wallpaper from Waypaper config
- **reload** - will toggle waybar, reload everything and fetch wallpaper color with wallust.

---

## Configs
- **Custom hyprland.conf**
- **Custom Alacritty.toml**
- **Custom wallust.toml**
- **Custom waybar**
- **Custom .zsh**
- **Custom btop**

---

## Notification Daemon
- **Mako** - lightweight notifications  
---
## Waybar
*Alot of the modules are copied from the waybar man pages and then changed slightly to my liking, there are some custom modules aswell.*

- **nmgui** - available in the waybar by pressing on network module. (needs **nmcli** - for backend).
- **blueman** - used for the bluetooth module.
- **custom cpu** - on hover will show cpu usage history.
- **custom battery** - will show battery percentage as normal and change icon respectively, animates icon during charging.
- **pulse audio** - uses normal pavucontrol for volume mixing.
- **temperature** - shows the temperature.
- **memory usage** - currently only shows usage, will probably implement a hover feature similar to custom cpus hover.
- **clock** - shows calender on hover, displays time.
---

## Installation
- also im bad at this, pick stuff that is interesting i dont recommend straight up copying. 
- Clone the repo, i dont have a install.sh yet.
---

## Applications
- `sudo pacman -Syu --needed alacritty waybar thunar neovim swaybg firefox btop flameshot mako lxappearance qt5ct qt6ct xfce4-settings xfce4-panel nmcli nmgui blueman`

- `yay -S --needed rofi wallust waypaper`
---