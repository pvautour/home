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
      #       targets.firefox.profileNames = [ "default" ];
      image = ../../wallpapers/ferns-2.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/greenscreen.yaml";

      cursor = {
        package = pkgs.rose-pine-hyprcursor;
        name = "RosePineMoon";
        size = 32;
      };
    };

    stylix.enableReleaseChecks = false; # Disable warning about home manager version mismatch

  };
}
