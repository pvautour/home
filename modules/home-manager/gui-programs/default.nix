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
      pkgs.wev
      pkgs.mesa-demos
      pkgs.hyprpolkitagent
    ];

    services.mako = {
      enable = true;
      defaultTimeout = 3000;
    };
    services.hyprpaper.enable = true;

    programs.fuzzel = {
      enable = true;
      settings = {
        main.icons-enabled = "no";
        border.radius = 0;
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
