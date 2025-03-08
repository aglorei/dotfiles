{
  config,
  ...
}: {
  imports = [./global];

  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.11";
}
