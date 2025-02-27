{ config, pkgs, inputs, ... }:

let
  system = "x86_64-linux";
  zen-browser = inputs.zen-browser.packages."${system}".default;

  #spicetify = inputs.spicetify-nix.lib.mkSpicetify pkgs {
   # enable = true;
    #enabledExtensions = [
    #  "adblock"
    # "hidePodcasts"
    #  "shuffle"
    #];
    #enabledCustomApps = [
    #  "newReleases"
    #  "ncsVisualizer"
    #];
    #enabledSnippets = [
    #  "rotatingCoverart"
    #  "pointer"
    #];
  #};

in {


  imports = [
    ./modules/default.nix
  ];


  home.username = "rootrim";
  home.homeDirectory = "/home/rootrim";

  home.packages = with pkgs; [
    neofetch
    zen-browser
    #spicetify
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
  ];

  home.file = {};

  home.sessionVariables = {};

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";  # Keep this unchanged.
}
