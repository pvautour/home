{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.cli-programs.enable = mkEnableOption "Enable cli-programs module";

  config = mkIf config.cli-programs.enable {
    home.shellAliases = {
      hu = "nix flake update --flake ~/.config/home-manager/";
      hc = "hx ~/.config/home-manager/";
      hm = "man home-configuration.nix";
      ns = "sudo nixos-rebuild switch";
      nb = "sudo nixos-rebuild build";
      f = "fastfetch";
      cd = "z";
      cdi = "zi";
      cat = "bat";
    };

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
    ];

    programs.gh = {
      enable = true;
      settings = {
        protocol = "ssh";
      };
    };

    programs.bash.enable = true;

    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "base16_transparent";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
        };
        editor.soft-wrap.enable = true;
        editor.bufferline = "multiple";
        keys.normal = {
          space.c = ":buffer-close";
          space.C = ":buffer-close!";
          space.l = ":toggle soft-wrap.enable";
          space.f = "file_picker_in_current_directory";
          space.F = "file_picker";
        };
      };
      languages.language = [
        {
          name = "bash";
          file-types = [
            "config"
            "conf"
          ];

        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        }
        {
          name = "html";
          auto-format = true;
        }
        {
          name = "json";
          auto-format = true;
        }
        {
          name = "typescript";
          auto-format = true;
        }
        {
          name = "javascript";
          auto-format = true;
        }

      ];
    };

    programs.git = {
      enable = true;
      userName = "Pascal Vautour";
      userEmail = "vautour.pascal@gmail.com";
      difftastic.enable = true;
      extraConfig = {
        push.autoSetupRemote = "true";
      };
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
      extraOptions = [
        "-s"
        "type"
      ];
    };

    programs.nushell = {
      enable = true;
      settings.show_banner = false;
    };

    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };

    programs.bat = {
      enable = true;
      config.theme = "base16";
    };
  };
}
