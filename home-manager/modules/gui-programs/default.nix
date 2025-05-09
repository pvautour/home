# hello.nix
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
  };
}
