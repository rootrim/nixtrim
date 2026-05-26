{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.zenithConfiguration = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.mikuPlymouth.nixosModules.default
      self.nixosModules.bluetooth
      self.nixosModules.boot
      self.nixosModules.dynamiku
      self.nixosModules.fcitx
      self.nixosModules.firewall
      self.nixosModules.fish
      self.nixosModules.fonts
      self.nixosModules.hyprland
      self.nixosModules.localization
      self.nixosModules.ly
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
      self.nixosModules.zapret
      self.nixosModules.zenithHardware
      self.nixosModules.zenithHomeRootrim
    ];

    networking.hostName = "zenith";
    console.keyMap = "trq";
    system.stateVersion = "25.11";
  };
}
