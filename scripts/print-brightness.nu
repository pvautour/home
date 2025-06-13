#!/usr/bin/env nu
let output = (brightnessctl g | str trim)

let formatted = [$output, " %"] | str join
print $formatted

~/.config/home-manager/scripts/notify.nu Brightness $formatted
