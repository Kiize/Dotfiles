#!/bin/sh
format() {
    if [ "$1" -eq 0 ]; then
        echo '-'
    else
        echo "$1"
    fi
}

updates_arch=$(checkupdates 2>/dev/null | wc -l)
updates_aur=$(yay -Qum 2>/dev/null | wc -l)
updates=$((updates_arch + updates_aur))

list_arch=$(checkupdates 2>/dev/null)
list_yay=$(yay -Qum 2>/dev/null)

if [ "$updates" -gt 0 ]; then
    num="($(format "$updates_arch")/$(format "$updates_aur"))"
    # lista unita con newline reali
    tooltip=$(printf "%s\n%s" "$list_arch" "$list_yay")
else
    num="Up to date."
    tooltip="-"
fi

echo -e "$num \n$tooltip"
