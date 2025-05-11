{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.gui-programs.enable = mkEnableOption "Enable gui-programs module";

  config = mkIf config.gui-programs.enable {

    home.packages = [
      pkgs.firefox
      pkgs.wofi
    ];

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "/home/pvautour/.config/home-manager/home-manager/modules/gui-programs/config/hypr/misty-forest.jpg"
        ];

        wallpaper = [
          ",/home/pvautour/.config/home-manager/home-manager/modules/gui-programs/config/hypr/misty-forest.jpg"
        ];
      };
    };

    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = builtins.readFile ./config/hypr/hyprland.conf;
    };
  };
}
