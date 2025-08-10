{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.gui.enable = mkEnableOption "Enable gui module";

  config = mkIf config.gui.enable {

    home.packages = [
      pkgs.firefox
      pkgs.wev
      pkgs.mesa-demos
      pkgs.hyprpolkitagent
      pkgs.zathura
      pkgs.feh
      pkgs.chromium
      pkgs.hyprshot
      pkgs.nautilus
      pkgs.gimp
    ];

    services.mako = {
      enable = true;
      defaultTimeout = 3000;
      settings.border-radius = 3;
    };
    services.hyprpaper.enable = true;

    programs.fuzzel = {
      enable = true;
      settings = {
        main.icons-enabled = "no";
        border.radius = 3;
      };

    };

    programs.kitty = {
      enable = true;
      settings = {
        shell = "${pkgs.nushell}/bin/nu"; # Set Nushell as the default shell in Kitty
      };
    };

    programs.bash.profileExtra = builtins.readFile ./config/bash/.profile;

    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = builtins.readFile ./config/hypr/hyprland.conf;
    };
  };
}
