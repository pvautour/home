#!/usr/bin/env nu
let output = (asusctl profile -p | str trim)

let formatted = $output | lines | last
print $formatted

~/.config/home-manager/scripts/notify.nu "Power Profile" $formatted
