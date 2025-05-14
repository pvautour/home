{
  pkgs,
  ...
}:

{
  imports = [ ../modules ];
  home.packages = [
    pkgs.pywal
  ];
  home.shellAliases = {
    hs = "home-manager switch --flake ~/.config/home-manager/hosts/work/#work";
    hb = "home-manager build --flake ~/.config/home-manager/hosts/work/#work";
    td = "hx /mnt/c/Users/pvautour/Documents/Work/todo/todo.md";
    sc = "hx /mnt/c/Users/pvautour/Documents/Work/todo/scratchpad.md";
    mn = "hx /mnt/c/Users/pvautour/Documents/Work/todo/meeting-notes.md";
    w = "wal --theme base16-greenscreen";
  };
  wsl-bash.enable = true;
}
