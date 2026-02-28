#!/bin/bash

# Function to convert hex to RGB ANSI escape sequence
hex_to_ansi() {
    local hex=$1
    hex=${hex#\#}
    
    if [[ ! $hex =~ ^[0-9A-Fa-f]{6}$ ]]; then
        echo "$1"
        return
    fi
    
    local r=$((16#${hex:0:2}))
    local g=$((16#${hex:2:2}))
    local b=$((16#${hex:4:2}))
    echo "\\u001b[38;2;${r};${g};${b}m"
}

# Function to create intermediate colors between two colors
blend_colors() {
    local color1=$1
    local color2=$2
    local ratio=$3  # 0.0 to 1.0
    
    color1=${color1#\#}
    color2=${color2#\#}
    
    local r1=$((16#${color1:0:2}))
    local g1=$((16#${color1:2:2}))
    local b1=$((16#${color1:4:2}))
    
    local r2=$((16#${color2:0:2}))
    local g2=$((16#${color2:2:2}))
    local b2=$((16#${color2:4:2}))
    
    local r=$(( r1 + (r2 - r1) * ratio / 100 ))
    local g=$(( g1 + (g2 - g1) * ratio / 100 ))
    local b=$(( b1 + (b2 - b1) * ratio / 100 ))
    
    printf "#%02x%02x%02x" $r $g $b
}

palette_file="$HOME/.config/wallpapers/colorpalette/palette.txt"

if [[ ! -f "$palette_file" ]]; then
    echo "ERROR: Palette file not found!"
    exit 1
fi

# Read colors from palette
colors=()
while IFS='=' read -r key value; do
    if [[ $key =~ ^color[0-9]+$ ]]; then
        colors+=("$value")
    fi
done < "$palette_file"

if [[ ${#colors[@]} -lt 16 ]]; then
    echo "ERROR: Not enough colors found"
    exit 1
fi

# Convert base colors
color0_ansi=$(hex_to_ansi "${colors[0]}")
color1_ansi=$(hex_to_ansi "${colors[1]}")
color2_ansi=$(hex_to_ansi "${colors[2]}")
color3_ansi=$(hex_to_ansi "${colors[3]}")
color4_ansi=$(hex_to_ansi "${colors[4]}")
color5_ansi=$(hex_to_ansi "${colors[5]}")
color6_ansi=$(hex_to_ansi "${colors[6]}")
color7_ansi=$(hex_to_ansi "${colors[7]}")
color8_ansi=$(hex_to_ansi "${colors[8]}")
color9_ansi=$(hex_to_ansi "${colors[9]}")
color10_ansi=$(hex_to_ansi "${colors[10]}")
color11_ansi=$(hex_to_ansi "${colors[11]}")
color12_ansi=$(hex_to_ansi "${colors[12]}")
color13_ansi=$(hex_to_ansi "${colors[13]}")
color14_ansi=$(hex_to_ansi "${colors[14]}")
color15_ansi=$(hex_to_ansi "${colors[15]}")

# Create gradient colors for the module list (brightest to darkest)
# We'll create 22 steps from color15 (brightest) to color0 (darkest)
gradient=()
for i in {0..21}; do
    ratio=$((i * 100 / 21))
    blended=$(blend_colors "${colors[15]}" "${colors[0]}" $ratio)
    gradient+=($(hex_to_ansi "$blended"))
done

output_file="$HOME/.config/fastfetch/config.jsonc"
mkdir -p "$(dirname "$output_file")"

cat > "$output_file" << EOF
{
    "\$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "file",
        "source": "/home/blurryface/.config/ascii/logo.txt",
        "color": {
            "1": "${color0_ansi}",
            "2": "${color8_ansi}",
            "3": "${color15_ansi}"
        }
    },
    "display": {
        "separator": " : ",
        "color": {
            "keys": "${color5_ansi}",
            "separator": "${color0_ansi}",
            "title": "${color13_ansi}"
        }
    },
    "modules": [
        {
            "type": "title",
            "color": {
                "user": "${color13_ansi}",
                "at": "${color5_ansi}",
                "host": "${color13_ansi}"
            }
        },
        "separator",
        {"type": "os", "key": " OS", "keyColor": "${gradient[0]}"},
        {"type": "host", "key": " Host", "keyColor": "${gradient[1]}"},
        {"type": "kernel", "key": " Kernel", "keyColor": "${gradient[2]}"},
        {"type": "uptime", "key": "󰔟 Uptime", "keyColor": "${gradient[3]}"},
        {"type": "packages", "key": "󰏖 Packages", "keyColor": "${gradient[4]}"},
        {"type": "shell", "key": " Shell", "keyColor": "${gradient[5]}"},
        {"type": "display", "key": "󰍹 Display", "keyColor": "${gradient[6]}"},
        {"type": "wm", "key": " WM", "keyColor": "${gradient[7]}"},
        {"type": "theme", "key": "󰉼 Theme", "keyColor": "${gradient[8]}"},
        {"type": "icons", "key": "󰀻 Icons", "keyColor": "${gradient[9]}"},
        {"type": "font", "key": " Font", "keyColor": "${gradient[10]}"},
        {"type": "cursor", "key": "󰇀 Cursor", "keyColor": "${gradient[11]}"},
        {"type": "terminal", "key": " Terminal", "keyColor": "${gradient[12]}"},
        {"type": "terminalfont", "key": " Terminal Font", "keyColor": "${gradient[13]}"},
        {"type": "cpu", "key": "󰻠 CPU", "keyColor": "${gradient[14]}"},
        {"type": "gpu", "key": "󰢮 GPU", "keyColor": "${gradient[15]}"},
        {"type": "memory", "key": "󰍛 Memory", "keyColor": "${gradient[16]}"},
        {"type": "swap", "key": "󰓡 Swap", "keyColor": "${gradient[17]}"},
        {"type": "disk", "key": "󰋊 Disk", "keyColor": "${gradient[18]}"},
        {"type": "localip", "key": "󰩟 Local IP", "keyColor": "${gradient[19]}"},
        {"type": "battery", "key": "󰁹 Battery", "keyColor": "${gradient[20]}"},
        {"type": "locale", "key": "󰗊 Locale", "keyColor": "${gradient[21]}"},
        "break",
        "colors",
        "break"
    ]
}
EOF

echo "Fastfetch config created with gradient!"