{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;

    shadow = true;
    shadowOffsets = [ 4 4 ];
    shadowOpacity = 0.7;

    fade = true;
    fadeDelta = 3;
    fadeSteps = [ 3.0e-2 3.0e-2 ];

    inactiveOpacity = 0.9;

    extraConfig = ''
      shadow-radius = 1
      corner-radius = 0

      blur: 
      {
        method = "dual_kawase";
        size = 10;
        strength = 3;
      };

      blur-background = true;
      blur-background-fixed = true;
    '';
  };
}
