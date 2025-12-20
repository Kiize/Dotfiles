#!/usr/bin/env python3
import subprocess
import json

# Esegui lo script bash e cattura l'output
result = subprocess.run(
    ["~/.config/waybar/scripts/package-update.sh"],
    stdout=subprocess.PIPE,
    shell=True,
    text=True
)

lines = result.stdout.strip().splitlines()

data = {}

# Primo elemento: numero
data['text'] = lines[0] if lines else "N/A"
# Tutto il resto: tooltip
data['tooltip'] = "\n".join(lines[1:]) if len(lines) > 1 else "-"

print(json.dumps(data))
#print(text)
