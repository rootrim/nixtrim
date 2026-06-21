{
  flake.nixosModules.boot = {
    lib,
    pkgs,
    ...
  }: let
    animegirl = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/cat-milk/Anime-Girls-Holding-Programming-Books/c04a6e18f474965b731b65e539ad69a94123c444/SICP/Isla_Angry_Holding_SICP.jpg";
      sha256 = "0zl4xvb2viai4hh29n669y947pnw3xam12svb9kgbzznkjbhdwn8";
    };
  in {
    boot = {
      loader = {
        systemd-boot.enable = lib.mkForce false;
        timeout = 5;
        limine = {
          enable = true;
          enrollConfig = true;
          efiSupport = true;
          maxGenerations = 5;
          resolution = "1920x1080";
          additionalFiles = {"efi/memtest86/memtest86.efi" = "${pkgs.memtest86-efi}/BOOTX64.efi";};
          secureBoot.enable = true;
          secureBoot.autoGenerateKeys = true;
          secureBoot.autoEnrollKeys.enable = true;
          style.interface.branding = "Zenith";
          style.wallpapers = ["${animegirl}"];
        };
      };
    };
  };
}
