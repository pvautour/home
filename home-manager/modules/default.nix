{ pkgs, lib, ... }:
{
  imports = [
    ./gui-programs
    ./hello/hello.nix
  ];
}
