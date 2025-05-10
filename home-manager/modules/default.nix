{ pkgs, lib, ... }:
{
  imports = [
    ./cli-programs
    ./gui-programs
  ];

  cli-programs.enable = lib.mkDefault true;
}
