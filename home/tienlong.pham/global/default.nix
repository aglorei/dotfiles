{
  inputs,
  lib,
  pkgs,
  config,
  outputs,
  ...
}: {
  imports = builtins.attrValues outputs.homeManagerModules;
  home.username = "tienlong.pham";
  home.homeDirectory = "/Users/${config.home.username}";

  # Cryptography
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  programs.git = {
    enable = true;
    includes = [{ path = "${config.xdg.configHome}/git/config.local"; }];
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      core.excludesFile = "${config.xdg.configHome}/git/ignore";
    };
  };
}
