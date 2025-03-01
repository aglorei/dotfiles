# Dotfiles
Configurations that I use in a [flakes](https://wiki.nixos.org/wiki/Flakes) approach. You can if you want, but no one is forcing you to.

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

## Step 3: Initialize and Active Configuration
Here, execute the initial activation while overriding the default configuration directory to the cloned repository destination.
```sh
nix run home-manager/release-24.11 -- init --switch $HOME/github.com/aglorei/dotfiles
```
