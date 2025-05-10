{ pkgs, lib, ... }:
{
  imports = [
    ./cli-programs
    ./gui-programs
    ./hello/hello.nix
  ];

  cli-programs.enable = lib.mkDefault true;
}
