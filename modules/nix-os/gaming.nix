{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.gaming.enable = mkEnableOption "Enable gaming module";

  config = mkIf config.gaming.enable {

    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    environment.systemPackages = with pkgs; [
      discord
    ];
  };
}
