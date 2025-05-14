{ pkgs, lib, ... }:
{
  imports = [
    ./cli-programs
    ./gui-programs
    ./cli-programs/wsl-bash.nix
  ];

  cli-programs.enable = lib.mkDefault true;
  news.display = "silent";
}
