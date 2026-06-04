#!/usr/bin/env bash


WALLPAPER_DIR="$HOME/Pictures/wallpapers-2025/"
#CURRENT_WALL=$(hyprctl hyprpaper listloaded)
# Get the name of the focused monitor with hyprctl
MONITORS=$(hyprctl monitors -j | jq -r '.[] | .name')
# FIXME: get current wallpaper and exclude it, newer hyprpaper removed the old way :(
for monitor in $MONITORS
do
    # Get a random wallpaper that is not the current one
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
    # Apply the selected wallpaper
    hyprctl hyprpaper wallpaper $monitor, $WALLPAPER
done