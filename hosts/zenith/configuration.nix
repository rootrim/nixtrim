{...}:
{
  imports =
    [
      ./hardware-configuration.nix
      ../modules/default.nix
    ];

  networking.hostName = "zenith";
  console.keyMap = "trq";
  system.stateVersion = "24.11";
}
