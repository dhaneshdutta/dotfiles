#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CACHE_DIR="$HOME/.cache/wallpaper-rofi"

mkdir -p "$CACHE_DIR"

generate_menu() {
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png,gif}; do
        [ -f "$img" ] || continue
        filename=$(basename "$img")
        cached_thumb="$CACHE_DIR/${filename%.*}.png"
        
        if [ ! -f "$cached_thumb" ] || [ "$img" -nt "$cached_thumb" ]; then
            if [[ "$img" == *.gif ]]; then
                convert "$img[0]" -thumbnail 160x160^ -gravity center -extent 160x160 "$cached_thumb"
            else
                convert "$img" -thumbnail 160x160^ -gravity center -extent 160x160 "$cached_thumb"
            fi
        fi
        
        printf "%s\0icon\x1f%s\n" "$filename" "$cached_thumb"
    done
}

change_wallpaper() {
    local wallpaper="$WALLPAPER_DIR/$1"
    
    if command -v swww &> /dev/null; then
        if [[ "$wallpaper" == *.gif ]]; then
            swww img "$wallpaper" \
                --transition-type grow \
                --transition-angle 30 \
                --transition-step 90 \
                --transition-duration 2 \
                --transition-fps 60 \
                --transition-bezier .65,.05,.36,1 \
                --gif
        else
            swww img "$wallpaper" \
                --transition-type grow \
                --transition-angle 30 \
                --transition-step 90 \
                --transition-duration 2 \
                --transition-fps 60 \
                --transition-bezier .65,.05,.36,1
        fi
    elif command -v swaybg &> /dev/null; then
        swaybg -i "$wallpaper" -m fill &
    else
        echo "Error: Neither swww nor swaybg found. Please install one of them."
        exit 1
    fi
    
    if command -v wal &> /dev/null; then
        wal -i "$wallpaper" -n
    fi
}

main() {
    chosen=$(generate_menu | rofi -dmenu -theme ~/.config/rofi/wallpaper-theme.rasi -show-icons -matching fuzzy -sort -sorting-method fzf -i)
    
    if [ -n "$chosen" ]; then
        change_wallpaper "$chosen"
    fi
}

main
