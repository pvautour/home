{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.gui-programs.enable = mkEnableOption "Enable gui-programs module";

  imports = [
    ./waybar.nix
  ];

  config = mkIf config.gui-programs.enable {

    home.packages = [
      pkgs.firefox
      pkgs.wofi
      pkgs.wev
      pkgs.mesa-demos
      pkgs.mako
      pkgs.hyprpolkitagent
    ];

    waybar.enable = true;

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "/home/pvautour/.config/home-manager/modules/home-manager/gui-programs/config/hypr/misty-forest.jpg"
        ];

        wallpaper = [
          ",/home/pvautour/.config/home-manager/modules/home-manager/gui-programs/config/hypr/misty-forest.jpg"
        ];
      };
    };

    programs.kitty = {
      enable = true;
      settings = {
        shell = "${pkgs.nushell}/bin/nu"; # Set Nushell as the default shell in Kitty
      };
    };

    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = builtins.readFile ./config/hypr/hyprland.conf;
    };
  };
}
