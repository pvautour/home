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
      image = ../../wallpapers/bay.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";

      cursor = {
        package = pkgs.rose-pine-hyprcursor;
        name = "RosePineMoon";
        size = 32;
      };
    };

    stylix.enableReleaseChecks = false; # Disable warning about home manager version mismatch

  };
}
