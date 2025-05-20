{
  pkgs,
  ...
}:

{
  imports = [ ../../modules/home-manager ];
  gui-programs.enable = true;
  syncthing.enable = true;
  home.packages = [
  ];
  home.shellAliases = {
    td = "hx ~/Sync/todo.md";
    sc = "hx ~/Sync/quicknote.md";
    mn = "hx ~/Sync/meeting-notes.md";
    hs = "home-manager switch --flake ~/.config/home-manager/#home";
    ns = "sudo nixos-rebuild switch --flake ~/.config/home-manager/#zephyrus-g15";
  };

  stylix = {
    enable = true;
    polarity = "dark";
    image = ../../modules/home-manager/gui-programs/config/hypr/misty-forest.jpg;
  };
}
