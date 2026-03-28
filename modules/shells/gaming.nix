{
  perSystem = {pkgs, ...}: {
    devShells.gaming = pkgs.mkShell {
      name = "gaming";
      packages = with pkgs; [
        wineWowPackages.stable
        winetricks
        vulkan-loader
        dxvk
        vkd3d
      ];
    };
  };
}
