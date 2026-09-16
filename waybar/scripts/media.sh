#!/bin/bash

# Find the first allowed MPRIS player that is playing or paused.
# Normal YouTube is excluded; YouTube Music is allowed.

player=$(playerctl -l 2>/dev/null | while read -r p; do
    url=$(playerctl -p "$p" metadata xesam:url 2>/dev/null)
    status=$(playerctl -p "$p" status 2>/dev/null)

    # Exclude normal YouTube videos.
    [[ "$url" == https://www.youtube.com/* ]] && continue

    if [[ "$status" == "Playing" || "$status" == "Paused" ]]; then
        echo "$p"
        break
    fi
done)

[ -z "$player" ] && exit 0


# Handle controls using the SAME selected player.
case "$1" in
    open)
        url=$(playerctl -p "$player" metadata xesam:url 2>/dev/null)
        [ -n "$url" ] && xdg-open "$url" >/dev/null 2>&1
        exit 0
        ;;

    play-pause)
        playerctl -p "$player" play-pause
        exit 0
        ;;

    next)
        playerctl -p "$player" next
        exit 0
        ;;

    previous)
        playerctl -p "$player" previous
        exit 0
        ;;
esac


# Get metadata.
artist=$(playerctl -p "$player" metadata artist 2>/dev/null)
title=$(playerctl -p "$player" metadata title 2>/dev/null)
player_name=$(playerctl -p "$player" metadata --format '{{playerName}}' 2>/dev/null)

# Fallbacks.
[ -z "$artist" ] && artist="Unknown Artist"
[ -z "$title" ] && title="Unknown Title"
[ -z "$player_name" ] && player_name="$player"

text="󰎆  $artist — $title"
tooltip="$player_name: $artist — $title"

# JSON-safe output.
text=$(printf '%s' "$text" | sed 's/\\/\\\\/g; s/"/\\"/g')
tooltip=$(printf '%s' "$tooltip" | sed 's/\\/\\\\/g; s/"/\\"/g')

echo "{\"text\":\"$text\",\"class\":\"mpris\",\"tooltip\":\"$tooltip\"}"