SSID=$(nmcli -f SSID device wifi list | fzf | awk '{$1=$1};1')
nmcli --ask device wifi connect "$SSID"