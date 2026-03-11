{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    # Nvidia f you
    # Fix the open-source on the lastest kernel
    open = true;

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
  services.xserver.videoDrivers = [ "nvidia" ];
}

