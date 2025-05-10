{
  pkgs,
  ...
}:

{
  imports = [ ../modules ];
  gui-programs.enable = true;
  home.packages = [
  ];
  home.shellAliases = {
    nc = "hx ~/.config/home-manager/configuration.nix";
    hs = "home-manager switch --flake ~/.config/home-manager/#home";
    hb = "home-manager build --flake ~/.config/home-manager/#home";
    td = "hx ~/Sync/todo/todo.md";
    sc = "hx ~/Sync/todo/scratchpad.md";
    mn = "hx ~/Sync/todo/meeting-notes.md";
  };

  programs.bash = {
    enable = true;
  };
}
