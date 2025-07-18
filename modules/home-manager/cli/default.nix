{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.cli.enable = mkEnableOption "Enable cli module";

  imports = [
    ./bash.nix
  ];

  config = mkIf config.cli.enable {

    home.shellAliases = {
      fu = "nix flake update --flake ~/.config/home-manager/";
      hc = "hx ~/.config/home-manager/";
      hm = "man home-configuration.nix";
      nm = "man configuration.nix";
      nb = "sudo nixos-rebuild build";
      f = "fastfetch";
      cd = "z";
      cdi = "zi";
      cat = "bat";
      d = "bash -c \"date '+%Y/%m/%d %H:%M:%S'\"";
      weather = "curl wttr.in/Ottawa";
      za = "zathura";
      erdd = "erd --dirs-only";
      erd2 = "erd -L 2";
    };

    home.packages = [
      #    #    pkgs.carapace  # todo: see if valuable and configure
      pkgs.erdtree
      pkgs.fzf
      pkgs.manix
      pkgs.nixfmt-rfc-style
      # Language servers for helix
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.vscode-langservers-extracted
      pkgs.nodePackages.yaml-language-server
      pkgs.nodePackages.svelte-language-server
      pkgs.nodePackages.serve
      #    pkgs.openssh
      pkgs.ripgrep
      pkgs.zip
      pkgs.unzip
      pkgs.fastfetch
      pkgs.pulsemixer # todo: Capability / sound
      pkgs.sd
      pkgs.fd
      pkgs.brightnessctl
      pkgs.bluetui
      pkgs.spotify-player
    ];

    programs.awscli = {
      enable = true;
      settings = {
        "default" = {
          region = "ca-central-1";
          output = "table";
        };
      };
    };

    programs.gh = {
      enable = true;
      settings = {
        protocol = "ssh";
      };
    };

    programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = {
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
        pull.ff = "only";
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
    };

    programs.bash.enable = true;

  };
}
