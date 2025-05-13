{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.wsl-bash.enable = mkEnableOption "Enable wsl-bash module";

  config = mkIf config.wsl-bash.enable {
    programs.bash = {
      enable = true;
      bashrcExtra = builtins.readFile ./config/wsl.bashrc;
      profileExtra = builtins.readFile ./config/wsl.profile;
    };
  };
}
