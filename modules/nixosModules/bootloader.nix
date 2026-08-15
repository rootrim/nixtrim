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

    escribar = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/pvtoari/grubphemous-theme/master/background/escribar_bg.png";
      sha256 = "01pfznzmnjfl894hw01kaxmb0nkvw889482yfgkn2w83gbsbbb3f";
    };

    crisanta = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/pvtoari/grubphemous-theme/master/background/crisanta_bg.png";
      sha256 = "1ifm2mzgw1cm2p8c7rfpbn5bv6syhaxnk4whclyd8wa4d48lmz4k";
    };

    penitent = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/pvtoari/grubphemous-theme/master/background/penitent_bg.png";
      sha256 = "0pzbbgf0xjc746sidbvkw8mz88c5p6bz1jxkwwjipi9b8dqwcvwf";
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
          secureBoot.enable = true;
          secureBoot.autoGenerateKeys = true;
          secureBoot.autoEnrollKeys.enable = true;
          style.interface.branding = "zenith";
          style.wallpapers = ["${animegirl}" "${escribar}" "${crisanta}" "${penitent}"];
        };
      };
    };
  };
}
