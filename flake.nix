{
  description = "Aglorei's Home Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    mkHomeConfig = { system, modulePaths }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
        extraSpecialArgs = { inherit inputs outputs; };
        modules = modulePaths;
      };
  in {
    overlays = import ./overlays {inherit inputs;};
    homeManagerModules = import ./modules/home-manager;

    homeConfigurations = {
      "aglorei@macbookpro" = mkHomeConfig {
        system = "aarch64-darwin";
        modulePaths = [
          ./home/aglorei/macbookpro.nix
        ];
      };
      "aglorei@mikasa" = mkHomeConfig {
        system = "x86_64-linux";
        modulePaths = [
          ./home/aglorei/mikasa.nix
        ];
      };
      "tienlong.pham@j2wnhywdqd" = mkHomeConfig {
        system = "aarch64-darwin";
        modulePaths = [
          ./home/tienlong.pham/j2wnhywdqd.nix
        ];
      };
    };
  };
}
