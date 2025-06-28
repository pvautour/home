#!/usr/bin/env nu
# volume-format.nu

let output = (pulsemixer --get-volume | str trim)
let volumes = ($output | split row " ")

let formatted = ($volumes | first | each {|v| $"($v)% " }) | str join
print $formatted

~/.config/home-manager/scripts/notify.nu Volume $formatted
