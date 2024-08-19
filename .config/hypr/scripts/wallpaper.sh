#!/bin/bash

commands=(
  "wal -i Pictures/Wallpapers/Earth.jpg & killall waybar &"
  "wal -i Pictures/Wallpapers/BerserkS.jpg & killall waybar &"
  "wal -i Pictures/Wallpapers/Berserk.jpg & killall waybar &"
  "wal -i Pictures/Wallpapers/Japan.jpeg & killall waybar &"  
)

random_index=$((RANDOM % ${#commands[@]}))

eval ${commands[$random_index]}
