#!/bin/bash

commands=(
  "wal -i Pictures/Wallpapers/Earth.jpg"
  "wal -i Pictures/Wallpapers/BerserkS.jpg"
  "wal -i Pictures/Wallpapers/Berserk.jpg"
  "wal -i Pictures/Wallpapers/Japan.jpeg"
  "wal -i Pictures/Wallpapers/Sekiro.jpg"
  "wal -i Pictures/Wallpapers/Sekiro1.jpg"  
  "wal -i Pictures/Wallpapers/Sekiro2.png"
  "wal -i Pictures/Wallpapers/YinYang.png"
  "wal -i Pictures/Wallpapers/Cyberpunk.png"
  "wal -i Pictures/Wallpapers/Wukong.png"
  "wal -i Pictures/Wallpapers/Galaxy.png"
  "wal -i Pictures/Wallpapers/LegoSW.png"
  "wal -i Pictures/Wallpapers/Rave.png"
)

index_file="/home/dhanesh/.config/hypr/scripts/.wallpaper_index"

if [ -f "$index_file" ]; then
  current_index=$(cat "$index_file")
else
  current_index=0
fi

eval "${commands[$current_index]}"

sleep 1

next_index=$(( (current_index + 1) % ${#commands[@]} ))

echo "$next_index" > "$index_file"
