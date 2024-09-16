#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CACHE_DIR="$HOME/.cache/wallpaper-rofi"

mkdir -p "$CACHE_DIR"

generate_menu() {
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
        filename=$(basename "$img")
        cached_thumb="$CACHE_DIR/${filename%.*}.png"
        
        if [ ! -f "$cached_thumb" ]; then
            convert "$img" -thumbnail 200x200^ -gravity center -extent 200x200 "$cached_thumb"
        fi
        
        echo -en "$filename\0icon\x1f$cached_thumb\n"
    done
}

change_wallpaper() {
    local wallpaper="$WALLPAPER_DIR/$1"
    
    # Change wallpaper with swww
    swww img "$wallpaper" --transition-type grow --transition-pos 1,1 --transition-duration 1.5 --transition-fps 60 --transition-angle 60
    
    # Generate color scheme with Wallust
    wallust run "$wallpaper"
    
    # Reload Rofi theme
    pkill -USR1 rofi
}

main() {
    # Source Wallust colors
    [ -f "$HOME/.cache/wallust/colors.sh" ] && . "$HOME/.cache/wallust/colors.sh"
    
    chosen=$(generate_menu | rofi -dmenu -i -p "Select Wallpaper" -theme ~/.config/rofi/wallpaper-theme.rasi)
    
    if [ -n "$chosen" ]; then
        change_wallpaper "$chosen"
    fi
}

main
