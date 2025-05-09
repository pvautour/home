{
  pkgs,
  ...
}:

{
  imports = [ ../modules ];
  hello.enable = true;
  home.packages = [
  ];
  home.shellAliases = {
    hs = "home-manager switch --flake ~/.config/home-manager/#home";
    hb = "home-manager build --flake ~/.config/home-manager/#home";
    td = "hx ~/Sync/todo/todo.md";
    sc = "hx ~/Sync/todo/scratchpad.md";
    mn = "hx ~/Sync/todo/meeting-notes.md";
  };

  programs.bash = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ../config/hyprland/hyprland.conf;
  };
}
