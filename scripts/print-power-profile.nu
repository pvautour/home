#!/usr/bin/env nu
let output = (asusctl profile get | str trim)

let formatted = $output | lines | first
print $formatted

~/.config/home-manager/scripts/notify.nu "Power Profile" $formatted
