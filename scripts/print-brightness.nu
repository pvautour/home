#!/usr/bin/env nu
let output = (brightnessctl -m | split row "," | get 3)

print $output

~/.config/home-manager/scripts/notify.nu Brightness $output
