{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tienlong.pham";
  home.homeDirectory = "/Users/tienlong.pham";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Shell
    pkgs.zsh

    # Tools
    pkgs.git
    pkgs.fasd
    pkgs.fd
    pkgs.fzf
    pkgs.jq
    pkgs.ripgrep
    pkgs.tmux
    pkgs.tree
    pkgs.unzip

    # Editor
    pkgs.neovim

    # Fonts
    pkgs.nerd-fonts.mononoki

    # Prompt
    pkgs.oh-my-zsh
    pkgs.starship
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

    # Terminal Multiplexer
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
