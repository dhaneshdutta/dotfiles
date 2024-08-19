#!/bin/bash

commands=(
  "swww img --transition-type fade Pictures/Wallpapers/Cyberpunk.gif"  
)

random_index=$((RANDOM % ${#commands[@]}))

eval ${commands[$random_index]}
