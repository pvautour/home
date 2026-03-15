{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.keyring.enable = mkEnableOption "Enable keyring module";

  config = mkIf config.keyring.enable {
    services.gnome-keyring.enable = true;
    home.packages = [ pkgs.gcr ]; # Provides org.gnome.keyring.SystemPrompter
  };
}
