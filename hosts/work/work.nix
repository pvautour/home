{
  pkgs,
  ...
}:

{
  imports = [ ../../modules/home-manager ];
  home.packages = [
  ];
  home.shellAliases = {
    hs = "home-manager switch --flake ~/.config/home-manager/#work";
    hb = "home-manager build --flake ~/.config/home-manager/#work";
    td = "hx /mnt/c/Users/pvautour/Documents/Work/todo/todo.md";
    sc = "hx /mnt/c/Users/pvautour/Documents/Work/todo/scratchpad.md";
    mn = "hx /mnt/c/Users/pvautour/Documents/Work/todo/meeting-notes.md";
    w = "wal --theme base16-greenscreen";
    set-aws = "sh ~/.config/home-manager/scripts/wsl-set-aws.sh";
  };
  wsl-bash.enable = true;
}
