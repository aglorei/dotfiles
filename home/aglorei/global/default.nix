{
  pkgs,
  config,
  outputs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.commons
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
  };

  home.username = "aglorei";

  home.packages = [
    pkgs.unstable.aichat
  ];

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
      core.editor = "nvim";
      core.excludesFile = "${config.xdg.configHome}/git/ignore";
      user.signing.key = "ED8839A2";
    };
  };

  # SSH
  programs.ssh = {
    enable = true;
    userKnownHostsFile = "/dev/null";
    extraConfig = "StrictHostKeyChecking no";
    includes = ["config.local"];
  };
}
