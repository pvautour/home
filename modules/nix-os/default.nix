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

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/home/user/my-nixos-config"; # sets NH_OS_FLAKE variable for you
  };
}
