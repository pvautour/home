if $env.IS_FOCUSED_MASTER {
    hyprctl dispatch "focuscurrentorlast"
    hyprctl dispatch "layoutmsg swapwithmaster"
} else {
    hyprctl dispatch "swapwithmaster"
}

