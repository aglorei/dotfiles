{
  config,
  ...
}: {
  imports = [./global];

  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "25.05";
}
