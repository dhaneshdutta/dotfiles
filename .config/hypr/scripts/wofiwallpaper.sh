#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Wofi style file
WOFI_STYLE="$HOME/.config/wofi/wallpaper_style.css"

# Create Wofi style file if it doesn't exist
if [ ! -f "$WOFI_STYLE" ]; then
    mkdir -p "$(dirname "$WOFI_STYLE")"
    cat << EOF > "$WOFI_STYLE"
window {
    background-color: rgba(0, 0, 0, 0.8);
    border-radius: 10px;
    font-family: "Noto Sans", sans-serif;
}

#input {
    border: 2px solid #ffffff;
    background-color: rgba(255, 255, 255, 0.1);
    color: #ffffff;
    border-radius: 5px;
    margin: 10px;
    padding: 5px;
}

#inner-box {
    background-color: transparent;
}

#outer-box {
    background-color: transparent;
    margin: 10px;
}

#scroll {
    margin: 5px;
}

#text {
    color: #ffffff;
    margin: 5px;
}

#entry:selected {
    background-color: rgba(255, 255, 255, 0.2);
    border-radius: 5px;
}
EOF
fi

# Get a list of wallpapers (filenames only)
wallpapers=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) -printf "%f\n")

# Use wofi to create a menu of wallpapers
selected=$(echo "$wallpapers" | wofi --dmenu \
                                     --prompt "Select wallpaper" \
                                     --style "$WOFI_STYLE" \
                                     --conf-file /dev/null \
                                     --width 500 \
                                     --height 400 \
                                     --cache-file /dev/null \
                                     --insensitive \
                                     --matching fuzzy)

# If a wallpaper was selected, set it using wal and swww
if [ -n "$selected" ]; then
    wallpaper_path="$WALLPAPER_DIR/$selected"
    
    # Set the wallpaper using swww
    swww img "$wallpaper_path" \
        --transition-fps 60 \
        --transition-type wipe \
        --transition-duration 2

    # Generate color scheme using wal
    wal -i "$wallpaper_path" -n  # -n flag prevents wal from setting the wallpaper
    
    # Optionally, you can source the new colors to apply them immediately
    # source "${HOME}/.cache/wal/colors.sh"
    
    # You might want to reload other components that depend on pywal colors
    # For example, reloading waybar:
    # pkill waybar && waybar &
fi
