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
      bashrcExtra = builtins.readFile ./config/wsl.bashrc;
      profileExtra = builtins.readFile ./config/wsl.profile;
    };

    home.shellAliases.paste = "powershell.exe -noprofile -command Get-Clipboard";
  };
}
