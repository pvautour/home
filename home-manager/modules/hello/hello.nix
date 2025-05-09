# hello.nix
{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.hello.enable = mkEnableOption "Enable hello module";

  config = mkIf config.hello.enable {
    programs.vim.enable = true;
  };
}
