# Dotfiles
Configurations that I use in a [flakes](https://wiki.nixos.org/wiki/Flakes) approach. You can if you want, but no one is forcing you to.

# Batteries Included

## Editor
- [LazyVim](https://www.lazyvim.org/)

## Font
- [Mononoki Nerd Font](https://madmalik.github.io/mononoki/)

## Shell
- [Oh My Zsh](https://ohmyz.sh/)
- [Starship](https://starship.rs/)
- [tmux](https://github.com/tmux/tmux/wiki)

## Theme
- [Kanagawa](https://github.com/rebelot/kanagawa.nvim)

# Installation

## Prerequisites
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Nix](https://nix.dev/install-nix)

## Step 1: Clone Repository
Clone the repository to your directory of choosing.
```sh
git clone https://github.com/aglorei/dotfiles $HOME/github.com/aglorei/dotfiles
```
## Step 2: Configure Nix
Add your channel of choice, update Nixpkgs.
```sh
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update
```
Optionally, enable flakes as an experimental feature [without additional command-line options](https://wiki.nixos.org/wiki/Flakes#Other_Distros,_without_Home-Manager).

## Step 3: Initialize Configuration
Include a `homeConfigurations` username and host combination (i.e., `echo $(whoami)@$(hostname -s)`) in [flake.nix](./flake.nix).
```nix
homeConfigurations = {
  # FIXME replace with your username@hostname
  "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
    extraSpecialArgs = { inherit inputs outputs; };
    modules = [
      ./home/your-username/your-hostname.nix
      # > include additional nixes <
    ];
  };
};
```

## Step 4: Activate Configuration
Apply the home configuration with a username and host combination.
```sh
nix run home-manager/release-24.11 -- switch --flake .#$(whoami)@$(hostname -s)
```
