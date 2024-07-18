#!/bin/bash

commands=(
    "swww img Pictures/Wallpapers/Earth.jpg"
    "swww img Pictures/Wallpapers/Saturn.jpg"
    "swww img Pictures/Wallpapers/Spiderman.jpg"
    "swww img Pictures/Wallpapers/oi.jpg"
)

random_index=$((RANDOM % ${#commands[@]}))

eval ${commands[$random_index]}
