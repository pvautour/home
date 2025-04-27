{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pvautour";
  home.homeDirectory = "/home/pvautour";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  xdg.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
#    pkgs.awscli2
#    #    pkgs.carapace  # todo: see if valuable and configure
    pkgs.erdtree
    pkgs.fzf
    pkgs.manix
#    pkgs.nerdfonts
    pkgs.nixfmt-rfc-style
#    # Language servers for helix
    pkgs.nodePackages.typescript-language-server
    pkgs.nodePackages.vscode-langservers-extracted
    pkgs.nodePackages.serve
#    pkgs.openssh
#    pkgs.pywal
    pkgs.ripgrep
    pkgs.zip
    pkgs.fastfetch
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pvautour/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    TERMINAL = "nu";
  };

  home.shellAliases = {
    hs = "home-manager switch --flake ~/.config/home-manager/#pvautour";
    hb = "home-manager build --flake ~/.config/home-manager/#pvautour";
    f = "fastfetch";
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  programs.git = {
    enable = true;
    userName = "Pascal Vautour";
    userEmail = "vautour.pascal@gmail.com";
    difftastic.enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    git = true;
  };

  programs.nushell = {
    enable = true;
  };

  programs.bash = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
   enable = true;
   extraConfig = builtins.readFile ./config/hyprland/hyprland.conf;
 };
 # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
