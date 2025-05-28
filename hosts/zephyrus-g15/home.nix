{
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/home-manager
    ../../modules/shared
  ];
  shared-stylix.enable = true;
  gui.enable = true;
  syncthing.enable = true;
  home.packages = [
  ];
  home.shellAliases = {
    td = "hx ~/Sync/todo.md";
    sc = "hx ~/Sync/quicknote.md";
    mn = "hx ~/Sync/meeting-notes.md";
    hs = "home-manager switch --flake ~/.config/home-manager/#home";
    ns = "sudo nixos-rebuild switch --flake ~/.config/home-manager/#zephyrus-g15";
    bbat = "cat /sys/class/power_supply/BAT0/capacity";
    power-draw = "awk '{print \$1*10^-6 \" W\"}' /sys/class/power_supply/BAT0/power_now";
  };

}
