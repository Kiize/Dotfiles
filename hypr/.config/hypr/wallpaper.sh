#!/bin/bash

# Directory degli sfondi
DIR="$HOME/Pictures/Wallpapers"

# Seleziona un'immagine a caso
RANDOM_PIC=$(find "$DIR" -type f | shuf -n 1)

# Ottieni il nome del monitor attivo (es. eDP-1, DP-1, etc.)
# Questo comando estrae il primo monitor configurato
#MONITOR=$(hyprctl monitors | grep "Monitor" | awk '{print $2}' | head -n 1)

# Comandi hyprpaper
# 1. Scarica tutti i wallpaper precedentemente caricati per pulire la RAM
hyprctl hyprpaper unload all

# 2. Precarica la nuova immagine
hyprctl hyprpaper preload "$RANDOM_PIC"

# 3. Imposta lo sfondo sul monitor
hyprctl hyprpaper wallpaper ",$RANDOM_PIC"
