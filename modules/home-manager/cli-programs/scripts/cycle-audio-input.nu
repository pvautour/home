#!/bin/nu
# TODO: This script does not work. It need to be changed.
# Path to store the notification ID
let notif_path = $"($env.XDG_RUNTIME_DIR)/custom_scripts/sound_source.txt"

# Get list of all sources
let sources = (pactl list short sources | lines | split column "\t" | get column2)

# Get the current default source
let current_source = (pactl get-default-source | str trim)

# Find the index of the current source
let current_index = ($sources | enumerate | where item == $current_source | get index.0)

# Compute next source index
let next_index = ($current_index + 1) mod ($sources | length)
let next_source = ($sources | get $next_index)

# Set the next source as default
pactl set-default-source $next_source

# Read old notification ID if it exists
let notif_id = (if ($notif_path | path exists ) {
    open $notif_path | str trim
} else {
    "1234567890"
})

# Send or replace the notification
let new_id = (notify-send --app-name="sound-source" --replace-id $notif_id "Sound Source" $"Switched to: ($next_source)" --print-id | str trim)

# Save new notification ID
mkdir ($notif_path | path dirname) 
echo $new_id | save -f $notif_path

# Also echo to terminal
echo $"Switched to: ($next_source)"

