{ config, pkgs, ... }:

{
  home.packages = [
    # Archive
    pkgs.unzip

    # Client
    pkgs.awscli2
    pkgs.azure-cli

    # Containers
    pkgs.docker
    pkgs.kubectl

    # Cryptography
    pkgs.gnupg

    # Editor
    pkgs.neovim

    # Fonts
    (pkgs.nerdfonts.override {
      fonts = [
        "Mononoki"
      ];
    })

    # Monitor
    pkgs.btop

    # Network
    pkgs.arp-scan
    pkgs.inetutils
    pkgs.nmap
    pkgs.wireshark

    # NodeJS
    pkgs.nodejs

    # Prompt
    pkgs.oh-my-zsh
    pkgs.starship

    # Python
    pkgs.python3

    # SCM
    pkgs.git

    # Shell
    pkgs.zsh

    # Terminal
    pkgs.tmux

    # Utility
    pkgs.fasd
    pkgs.fd
    pkgs.figlet
    pkgs.fzf
    pkgs.jq
    pkgs.neofetch
    pkgs.pstree
    pkgs.ripgrep
    pkgs.tree
  ];

  home.file = {
    # Editor
    "${config.xdg.configHome}/nvim" = {
      source = ./assets/nvim;
      recursive = true;
    };

    # Prompt
    "${config.xdg.configHome}/starship.toml".source = ./assets/starship/starship.toml;

    # Terminal
    "${config.xdg.configHome}/alacritty.toml".source = ./assets/alacritty/alacritty.toml;
    ".tmux.conf".source = ./assets/tmux/tmux.conf;
  };

  # Cryptography
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # Home-Manager
  programs.home-manager.enable = true;

  # Prompt
  programs.starship.enable = true;

  # Shell
  programs.zsh = {
    enable = true;
    shellAliases = {
      # list
      ls = "ls -G";
      ll = "ls -alhHF";

      # grep
      egrep = "egrep --color";
      fgrep = "fgrep --color";
      grep = "grep --color";

      # file utils
      rm = "rm -i";
      mv = "mv -i";
      cp = "cp -i";
      ln = "ln -i";

      # tmux
      hack = "tmux a -t hack || tmux new -s hack";
    };
    syntaxHighlighting.enable = true;
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" "fasd" "fzf" ];
  };
}
