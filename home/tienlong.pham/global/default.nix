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

  home.username = "tienlong.pham";
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
    includes = [{path = "${config.xdg.configHome}/git/config.local";}];
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      core.excludesFile = "${config.xdg.configHome}/git/ignore";
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
