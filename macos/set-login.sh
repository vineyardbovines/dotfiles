#!/bin/bash

# set login items

declare -a LOGIN_ITEMS=(
    "/Applications/Battery Indicator.app"
    "/Applications/CleanShot X.app"
    "/Applications/Expo Orbit.app"
    "/Applications/Ice.app"
    "/Applications/Menu Bar Calendar.app"
    "/Applications/noTunes.app"
    "/Applications/Raycast.app"
    "/Applications/Rectangle.app"
)

CURRENT_ITEMS=$(osascript -e 'tell application "System Events" to get the name of every login item' 2>/dev/null)

for APP_PATH in "${LOGIN_ITEMS[@]}"; do
    APP_NAME=$(basename "$APP_PATH" .app)

    if [[ -d "$APP_PATH" ]]; then
        if ! echo "$CURRENT_ITEMS" | grep -q "$APP_NAME"; then
            osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"$APP_PATH\", hidden:false}" 2>/dev/null
        fi
    fi
done
