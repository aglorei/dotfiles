{
  config,
  ...
}: {
  imports = [./global];

  home.homeDirectory = "/Users/${config.home.username}";
  home.stateVersion = "24.11";
}
