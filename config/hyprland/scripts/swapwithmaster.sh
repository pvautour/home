if is_focused_master:
   hyprctl dispatch "focuscurrentorlast"
   hyprctl dispatch "layoutmsg swapwithmaster"
else:
   hyprctl dispatch "swapwithmaster"
