{
  pkgs,
  lib,
  userSettings,
  ...
}:
{
  # Custom Configurations
  imports = [
    ./stylix.nix
  ];
}
