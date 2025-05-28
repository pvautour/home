{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.wsl.enable = mkEnableOption "Enable wsl bash module";

  config = mkIf config.wsl.enable {
    programs.bash = {
      bashrcExtra = builtins.readFile ./config/bash-wsl/.bashrc;
      profileExtra = builtins.readFile ./config/bash-wsl/.profile;
    };

    home.shellAliases.paste = "powershell.exe -noprofile -command Get-Clipboard";
  };
}
