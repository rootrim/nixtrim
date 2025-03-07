{config, pkgs, ...}:
{
  environment.systemPackages = [ pkgs.cudatoolkit ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;

    prime = {
      offload = {
			  enable = true;
			  enableOffloadCmd = true;
		  };
		  intelBusId = "PCI:0:2:0";
		  nvidiaBusId = "PCI:01:0:0";
    };
  };
}
