{ pkgs, lib, ... }:
{
  imports = [
    ./cli-programs
    ./gui-programs
    ./gaming
  ];

  cli-programs.enable = lib.mkDefault true;
}
