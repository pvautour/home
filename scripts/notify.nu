#!/usr/bin/env nu

# notify.nu
def main [app_name, content] {

if ($app_name == null or $content == null) {
    print "Usage: notify.nu <app_name> <content>"
    exit 1
}

let notif_dir = $"($env.XDG_RUNTIME_DIR)/custom_scripts"
let notif_path = $"($notif_dir)/($app_name).txt"

mkdir $notif_dir

let notif_id = (if ($notif_path | path exists) {
    open $notif_path | str trim
} else {
    "1234567890"
})

let notif_id = notify-send --app-name $"($app_name)" --replace-id $"($notif_id)" $"($app_name)" $"($content)" -p

$notif_id | save --force $notif_path

}
