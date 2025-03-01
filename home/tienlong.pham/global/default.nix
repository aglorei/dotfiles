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
}
