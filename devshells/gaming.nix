{pkgs}:
pkgs.mkShell {
  name = "gaming-devshell";
  packages = with pkgs; [
    wineWowPackages.stable
    winetricks
    vulkan-loader
    dxvk
    vkd3d
  ];
}
