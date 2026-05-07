{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.zenithConfiguration = {
    imports = [
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.zenithHomeRootrim
      self.nixosModules.bluetooth
      self.nixosModules.boot
      self.nixosModules.fcitx
      self.nixosModules.firewall
      self.nixosModules.fish
      self.nixosModules.fonts
      self.nixosModules.hyprland
      self.nixosModules.localization
      self.nixosModules.networking
      self.nixosModules.nh
      self.nixosModules.nix-ld
      self.nixosModules.nixSettings
      self.nixosModules.nvidia
      self.nixosModules.packages
      self.nixosModules.secrets
      self.nixosModules.services
      self.nixosModules.sound
      self.nixosModules.steam
      self.nixosModules.tabletDriver
      self.nixosModules.usersRootrim
      self.nixosModules.virtualisation
      self.nixosModules.zenithHardware
      self.nixosModules.zapret
      self.nixosModules.ly
    ];

    networking.hostName = "zenith";
    console.keyMap = "trq";
    system.stateVersion = "25.11";
  };
}
