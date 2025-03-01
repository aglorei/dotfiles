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
}
