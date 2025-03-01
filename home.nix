{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tienlong.pham";
  home.homeDirectory = "/Users/tienlong.pham";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "24.11";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Archive
    pkgs.unzip

    # Client
    pkgs.awscli2
    pkgs.azure-cli

    # Containers
    pkgs.docker
    pkgs.kubectl

    # Editor
    pkgs.neovim

    # Fonts
    pkgs.nerd-fonts.mononoki

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

    # Shell
    pkgs.zsh

    # Utility
    pkgs.git
    pkgs.gnupg
    pkgs.fasd
    pkgs.fd
    pkgs.figlet
    pkgs.fzf
    pkgs.jq
    pkgs.neofetch
    pkgs.pstree
    pkgs.ripgrep
    pkgs.tmux
    pkgs.tree
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # Neovim
    "${config.xdg.configHome}/nvim" = {
      source = ./nvim;
      recursive = true;
    };

    # Starship
    "${config.xdg.configHome}/starship.toml".source = ./starship/starship.toml;

    # Terminal
    "${config.xdg.configHome}/alacritty.toml".source = ./alacritty/alacritty.toml;
    ".tmux.conf".source = ./tmux/tmux.conf;
  };

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

  # Prompt
  programs.starship.enable = true;

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" "fasd" "fzf" ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
