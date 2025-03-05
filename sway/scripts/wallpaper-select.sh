#!/usr/bin/env bash
## Wallpaper Selector for SwayFX
## Integrates with existing Rofi configuration

# Directories
WALLPAPER_DIR="$HOME/docs/wall"
CACHE_DIR="$HOME/.cache/wallpaper-thumbs"
ROFI_CONFIG_DIR="$HOME/.config/rofi"

# Create cache directory
mkdir -p "$CACHE_DIR"

# Generate thumbnails for wallpapers (if needed)
find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | while read -r img; do
    filename=$(basename "$img")
    thumb="$CACHE_DIR/${filename}.thumb.png"
    if [ ! -f "$thumb" ] || [ "$img" -nt "$thumb" ]; then
        if command -v convert &> /dev/null; then
            convert "$img" -thumbnail 200x200 -gravity center -extent 200x200 "$thumb"
        else
            cp "$img" "$thumb"
        fi
    fi
done

# Function to apply wallpaper
apply_wallpaper() {
    local wallpaper="$1"
    if [ -f "$wallpaper" ]; then
        # Apply wallpaper using swaymsg
        swaymsg "output * bg '$wallpaper' fill"
        
        # Save to config for persistence
        sed -i "s|output \* bg .* fill|output * bg '$wallpaper' fill|" "$HOME/.config/sway/config"
        
        # Notify user
        if command -v notify-send &> /dev/null; then
            notify-send -i "$wallpaper" "Wallpaper Changed" "$(basename "$wallpaper")"
        fi
    fi
}

# Get list of wallpapers
WALLPAPERS=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | sort)

# Create a formatted list using rofi's icon syntax
FORMATTED_LIST=""
for wall in $WALLPAPERS; do
    filename=$(basename "$wall")
    thumb="$CACHE_DIR/${filename}.thumb.png"
    FORMATTED_LIST+="$wall\0icon\x1f$thumb\n"
done

# Instead of creating a custom theme file, we'll use theme-str to override specific properties
# This avoids the import path issues
chosen=$(echo -en "$FORMATTED_LIST" | rofi -dmenu \
    -i \
    -p "Select Wallpaper" \
    -theme "$ROFI_CONFIG_DIR/launchers/type-3/style-10.rasi" \
    -theme-str 'window {transparency: true; background-color: rgba(0, 0, 0, 0.8);}' \
    -theme-str 'listview {columns: 4; lines: 4; spacing: 10px;}' \
    -theme-str 'element {orientation: vertical; padding: 20px;}' \
    -theme-str 'element-icon {size: 120px;}' \
    -preview "swaymsg output * bg '{1}' fill >/dev/null" \
    -kb-custom-2 "Alt+r" \
    -mesg "↑↓: Navigate | Enter: Apply | Alt+r: Random")

# Handle result based on exit code
exit_code=$?
if [ $exit_code -eq 0 ] && [ -n "$chosen" ]; then
    apply_wallpaper "$chosen"
elif [ $exit_code -eq 11 ]; then
    # Alt+r pressed - Random sort
    RANDOM_WALLPAPER=$(echo "$WALLPAPERS" | sort -R | head -n 1)
    apply_wallpaper "$RANDOM_WALLPAPER"
fi
