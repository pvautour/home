{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Custom Configurations
  imports = [
    ./gaming.nix
  ];
}
