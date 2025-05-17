{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.syncthing.enable = mkEnableOption "Enable syncthing module";

  config = mkIf config.syncthing.enable {
    services.syncthing = {
      enable = true;
      settings = {
        devices = {
          s21-fe = {
            id = "OHIG3MY-X6TO2ZV-W4KKAQO-6DIQZX2-TD65BKR-HOVB6H4-D2MKJJK-YWR5TAV";
          };
          zephyrus-g15 = {
            id = "MJPCVLD-EYCSXPN-O2VGKKQ-LAC3YO2-SFMYHI3-EKNKERG-5Y7SUO6-MTOX4AJ";
          };
        };
        folders = {
          "Sync" = {
            path = "~/Sync";
            devices = [
              "s21-fe"
              "zephyrus-g15"
            ];
          };
        };
      };
    };
  };
}
