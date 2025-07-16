{
  description = "Aglorei's Home Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    forAllSystems = pkgsFunc: nixpkgs.lib.genAttrs systems (system:
      pkgsFunc (import nixpkgs { inherit system; config.allowUnfree = true; })
    );

    mkHomeConfig = { system, modulePaths }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit inputs outputs; };
        modules = modulePaths;
      };
  in {
    packages = forAllSystems (pkgs: import ./pkgs pkgs);
    formatter = forAllSystems (pkgs: pkgs.alejandra);

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
