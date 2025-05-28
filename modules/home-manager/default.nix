{
  pkgs,
  lib,
  userSettings,
  ...
}:
{
  # Home Manager configuration
  home.username = userSettings.username;
  home.homeDirectory = userSettings.homeDirectory;
  home.stateVersion = "24.05";
  xdg.enable = true;
  programs.home-manager.enable = true;
  news.display = "silent";

  # Custom Configurations
  imports = [
    ./cli
    ./gui
    ./services
  ];

  cli.enable = lib.mkDefault true;
}
