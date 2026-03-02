# 🌌 My Hyprland Rice

The rice focuses **primarily on aesthetic** but also on **productivity**.  

---

## 🖥️ Terminal Emulator
- **Alacritty** - spawns as a floating window with custom ASCII art, binded to SUPER + ENTER

---

## 🪟 Tiling Window Manager
- **Hyprland** - tiling window manager  
- **Waybar** - status bar binded to SUPER + W

---
## Application Viewer

- **Rofi** binded to SUPER + E

---
## 📁 File Manager

- **Thunar** - lightweight alternative  

---

## 🎨 Wallpaper & Colors
- **Wallust** - fetches wallpapers & color palettes  
- **swaybg** - wallpaper backend  
- **waypaper** - wallpaper frontend binded to SUPER + P

---

## 🌐 Web Browser
- **Firefox**  - binded to SUPER + S

---

## ⚡ Utilities
- **Btop** - system monitor binded to SUPER + B

---

## 📜 Scripts
- **Battery script** - tracks battery level (used in status bar)  
- **Zoom** - zoom in/out using `MOD + numpad (+/-)`  
- **getWallpaper** - fetches wallpaper from Waypaper config
- **reload** - will toggle waybar, reload everything and fetch wallpaper color with wallust.

---

## ⚙️ Configs
- **Custom hyprland.conf**
- **Custom Alacritty.toml**
- **Custom wallust.toml**
- **Custom waybar**
- **Custom .zsh**
- **Custom btop**

---

## 🔔 Notification Daemon
- **Mako** - lightweight notifications  

## Network Manager gui
- **nmgui** - available in the waybar by pressing on network module. (needs **nmcli** - for backend).


## Installation
also im bad at this, pick stuff that is interesting i dont recommend copying me.
Clone the repo, i dont have a install.sh yet.

### Applications
sudo pacman -Syu --needed alacritty waybar thunar neovim swaybg firefox btop discord flameshot mako lxappearance qt5ct qt6ct xfce4-settings xfce4-panel

yay -S --needed rofi wallust waypaper