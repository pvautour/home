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
      image = ../../wallpapers/ferns-2.jpg;
      base16Scheme = {
        base00 = "#001100"; # background
        base01 = "#00ff00"; # lighter background
        base02 = "#00bb00"; # selection background
        base03 = "#007700"; # comments, invisibles
        base04 = "#009900"; # dark foreground (status bars)
        base05 = "#00bb00"; # main foreground text
        base06 = "#005500"; # light foreground
        base07 = "#00bb00"; # light background (unused mostly)
        base08 = "#FFBF00"; # error (amber)  # Error - Amber
        base09 = "#007700"; # accent (orange)
        base0A = "#FFB642"; # warning (burnt yellow)  # Warning - Burnt Yellow
        base0B = "#007700"; # success
        base0C = "#009900"; # for regex, diff additions, etc.
        base0D = "#00bb00"; # functions, keywords
        base0E = "#005500"; # classes/types
        base0F = "#00ff00"; # deprecated, custom
        name = "CustomGreenAmberContrast";
      };
    };

    stylix.enableReleaseChecks = false; # Disable warning about home manager version mismatch

  };
}
