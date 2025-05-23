#!/bin/nu
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

# Show new default sink
notify-send --app-name="sound-sink" "Sound Sink" $"Switched to: ($next_sink)"
echo $"Switched to: ($next_sink)"

