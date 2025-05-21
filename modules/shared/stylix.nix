{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.shared-stylix.enable = mkEnableOption "Enable shared-stylix module";

  config = mkIf config.shared-stylix.enable {

    stylix = {
      enable = true;
      polarity = "dark";
      image = ./backgrounds/ferns.jpg;
    };

    stylix.enableReleaseChecks = false; # Disable warning about home manager version mismatch

  };
}
