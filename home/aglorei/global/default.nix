{
  inputs,
  lib,
  pkgs,
  config,
  outputs,
  ...
}: {
  imports = builtins.attrValues outputs.homeManagerModules;
  home.username = "aglorei";
  home.homeDirectory = "/Users/${config.home.username}";

  # Cryptography
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # SCM
  programs.git = {
    enable = true;
    userName = config.home.username;
    userEmail = "10876966+aglorei@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";

      commit.gpgSign = true;
      user.signing.key = "ED8839A2";
    };
  };
}
