{
  perSystem = {pkgs, ...}: {
    devShells.gaming = pkgs.mkShell {
      name = "gaming";
      packages = with pkgs; [
        wineWow64Packages.stable
        winetricks
        vulkan-loader
        dxvk
        vkd3d
      ];
    };
  };
}
