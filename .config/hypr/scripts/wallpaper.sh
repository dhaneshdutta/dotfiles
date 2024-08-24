#!/bin/bash

commands=(
  "wal -i Pictures/Wallpapers/Earth.jpg & killall waybar &"
  "wal -i Pictures/Wallpapers/BerserkS.jpg & killall waybar &"
  "wal -i Pictures/Wallpapers/Berserk.jpg & killall waybar &"
  "wal -i Pictures/Wallpapers/Japan.jpeg & killall waybar &"  
)

index_file="/home/$USER/.config/hypr/scripts/.wallpaper_index"

if [ -f "$index_file" ]; then
  current_index=$(cat "$index_file")
else
  current_index=0
fi

eval "${commands[$current_index]}"

next_index=$(( (current_index + 1) % ${#commands[@]} ))

echo "$next_index" > "$index_file"
