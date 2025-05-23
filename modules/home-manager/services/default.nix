{
pkgs
  ...
}:

{
  imports = [
    ./syncthing.nix
  ];

  pkgs.libnotify;
}
