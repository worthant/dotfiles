#!/bin/bash
# Save as ~/.config/sway/scripts/wallpaper-picker.sh

WALLPAPER_DIR="$HOME/docs/wall"
CACHE_DIR="$HOME/.cache/wallpaper-thumbs"

# Create cache directory
mkdir -p "$CACHE_DIR"

# Generate thumbnails (if they don't exist)
find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | while read -r img; do
    thumb="$CACHE_DIR/$(basename "$img").thumb.png"
    if [ ! -f "$thumb" ]; then
        convert "$img" -thumbnail 200x200 "$thumb" || \
        magick "$img" -thumbnail 200x200 "$thumb" || \
        echo "Thumbnail creation failed for $img - install ImageMagick"
    fi
done

# Function to preview wallpaper
apply_wallpaper() {
    local wall="$1"
    if [ -f "$wall" ]; then
        # Apply wallpaper using swaymsg (works reliably with SwayFX)
        swaymsg "output * bg '$wall' fill"
        
        # Optional: Save to config for persistence
        sed -i "s|output \* bg .* fill|output * bg '$wall' fill|" "$HOME/.config/sway/config"
        
        # Optional: Show notification
        notify-send "Wallpaper" "Applied: $(basename "$wall")" -i "$wall"
        
        # Save current wallpaper
        echo "$wall" > "$HOME/.cache/current_wallpaper"
    fi
}

# Build a list of wallpapers with their timestamps for sorting
build_wallpaper_list() {
    local sort_mode="$1"
    local wall_list=""
    
    case "$sort_mode" in
        "recent")
            # Sort by modification time (newest first)
            wall_list=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) -printf "%T@ %p\n" | sort -nr | cut -d' ' -f2-)
            ;;
        "name")
            # Sort by filename
            wall_list=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | sort)
            ;;
        "random")
            # Randomize order
            wall_list=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | sort -R)
            ;;
        *)
            # Default sorting
            wall_list=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \))
            ;;
    esac
    
    echo "$wall_list"
}

# Show Rofi with enhanced theme and preview capabilities
show_rofi_selector() {
    # Get wallpaper list (default to name sorting)
    wallpapers=$(build_wallpaper_list "name")
    
    # Launch Rofi with custom configuration for wallpaper selection
    selected=$(echo "$wallpapers" | rofi -dmenu \
        -i \
        -p "Select Wallpaper" \
        -show-icons \
        -theme-str 'window {transparency: "real"; background-color: rgba(0,0,0,0.75); width: 80%; height: 70%;}' \
        -theme-str 'listview {columns: 3; lines: 3; spacing: 12px;}' \
        -theme-str 'element {orientation: vertical; padding: 15px; border-radius: 12px;}' \
        -theme-str 'element-icon {size: 15em;}' \
        -kb-custom-1 "Alt+p" \
        -kb-custom-2 "Alt+r" \
        -kb-custom-3 "Alt+n" \
        -kb-custom-4 "Alt+s" \
        -mesg "↑↓: Navigate | Alt+p: Preview | Alt+r: Random | Alt+n: Sort by Name | Alt+s: Sort by Recent")
    
    # Handle custom key bindings
    if [ "$?" -eq 10 ]; then
        # Alt+p was pressed - preview the current selection
        apply_wallpaper "$selected"
        # Call the selector again to continue browsing
        show_rofi_selector
    elif [ "$?" -eq 11 ]; then
        # Alt+r was pressed - resort randomly
        wallpapers=$(build_wallpaper_list "random")
        show_rofi_selector
    elif [ "$?" -eq 12 ]; then
        # Alt+n was pressed - sort by name
        wallpapers=$(build_wallpaper_list "name")
        show_rofi_selector
    elif [ "$?" -eq 13 ]; then
        # Alt+s was pressed - sort by recent
        wallpapers=$(build_wallpaper_list "recent")
        show_rofi_selector
    elif [ -n "$selected" ]; then
        # Apply wallpaper if something was selected
        apply_wallpaper "$selected"
    fi
}

# Main execution
show_rofi_selector
