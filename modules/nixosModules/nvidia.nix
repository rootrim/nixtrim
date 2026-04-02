{
  flake.nixosModules.nvidia = {
    config,
    lib,
    pkgs,
    ...
  }: let
    nvidiaPackage = config.hardware.nvidia.package;
  in {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
      ];
    };
    hardware.nvidia = {
      modesetting.enable = true;
      open = lib.mkOverride 990 (nvidiaPackage ? open && nvidiaPackage ? firmware);

      powerManagement.enable = true;
      powerManagement.finegrained = true;

      nvidiaSettings = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    services.xserver.videoDrivers = lib.mkDefault ["nvidia"];
  };
}
