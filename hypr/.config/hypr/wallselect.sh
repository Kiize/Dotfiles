#!/bin/bash

WALL_DIR="$HOME/Pictures/Wallpapers"
THEME="$HOME/.config/rofi/wallselect.rasi"

# Funzione per listare le immagini con le loro icone
list_wallpapers() {
    find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | while read -r img; do
        echo -en "$(basename "$img")\0icon\x1f$img\n"
    done
}

# Esecuzione Rofi
CHOICE=$(list_wallpapers | rofi -dmenu -i -p "󰸉 Wallpapers" -theme "$THEME")

# Se l'utente seleziona un file
if [ -n "$CHOICE" ]; then
    FULL_PATH="$WALL_DIR/$CHOICE"
    
    # Applica con hyprpaper
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$FULL_PATH"
    hyprctl hyprpaper wallpaper ",$FULL_PATH,tile"
fi
