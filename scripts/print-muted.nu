#!/usr/bin/env nu
let is_muted = (pulsemixer --get-mute | str trim)

let formatted = if $is_muted == "1" { "Muted 🔇" } else { "Unmuted 🔊" }
print $formatted

~/.config/home-manager/scripts/notify.nu Volume $formatted
