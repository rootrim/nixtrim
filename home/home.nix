{ config, pkgs, inputs, ... }:

let
  system = "x86_64-linux";
  zen-browser = inputs.zen-browser.packages."${system}".default;
in {


  imports = [
    ./modules/default.nix
  ];


  home.username = "rootrim";
  home.homeDirectory = "/home/rootrim";

  home.packages = with pkgs; [
    neofetch
    zen-browser
    git
    neovim
    gcc
    python3
    rustc
    cargo
    gnumake
    wget
    curl
    lazygit
    kitty
    tmux
    onefetch
    lua
    imagemagick
    lua5_1
    luarocks
  ];

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";  # Keep this unchanged.
}
