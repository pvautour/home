#!/bin/nu
# Path to store the notification ID
let notif_path = $"($env.XDG_RUNTIME_DIR)/custom_scripts/sound_sink.txt"

# Get list of all sinks
let sinks = (pactl list short sinks | lines | split column "\t" | get column2)

# Get the current default sink
let current_sink = (pactl get-default-sink | str trim)

# Find the index of the current sink
let current_index = ($sinks | enumerate | where item == $current_sink | get index.0)

# Compute next sink index
let next_index = ($current_index + 1) mod ($sinks | length)
let next_sink = ($sinks | get $next_index)

# Set the next sink as default
pactl set-default-sink $next_sink

# Move all active streams to the new default sink
pactl list short sink-inputs | lines | each {|line|
    let cols = ($line | split column "\t")
    let stream_id = ($cols | get column1)
    if ($stream_id != "") {
        pactl move-sink-input ...$stream_id $next_sink
    }
}

# Read old notification ID if it exists
let notif_id = (if ($notif_path | path exists ) {
    open $notif_path | str trim
} else {
    "1234567890"
})

# Send or replace the notification
let new_id = (notify-send --app-name="sound-sink" --replace-id $notif_id "Sound Sink" $"Switched to: ($next_sink)" --print-id | str trim)

# Save new notification ID
mkdir ($notif_path | path dirname) 
echo $new_id | save -f $notif_path

# Also echo to terminal
echo $"Switched to: ($next_sink)"

