{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.dwm = {
    self',
    pkgs,
    ...
  }: {
    services.xserver = {
      enable = false;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      xkb.layout = "tr";
      xkb.options = "caps:swapescape";

      windowManager.dwm = {
        enable = self'.services.xserver.enable;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    };
  };

  perSystem = {pkgs, ...}: {
    packages.dwamdelius = inputs.dwm.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
