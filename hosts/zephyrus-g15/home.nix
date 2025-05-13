{
  pkgs,
  ...
}:

{
  imports = [ ../../modules/home-manager ];
  gui-programs.enable = true;
  home.packages = [
  ];
  home.shellAliases = {
    td = "hx ~/Sync/todo/todo.md";
    sc = "hx ~/Sync/todo/scratchpad.md";
    mn = "hx ~/Sync/todo/meeting-notes.md";
    hs = "home-manager switch --flake /home/pvautour/.config/home-manager/#home";
    ns = "sudo nixos-rebuild switch --flake /home/pvautour/.config/home-manager/#zephyrus-g15";
  };
}
