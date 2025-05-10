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

    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = builtins.readFile ../../config/hyprland/hyprland.conf;
    };
  };
}
