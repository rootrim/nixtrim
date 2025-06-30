{
  config,
  lib,
  ...
}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
  };
  home.file.".config/starship.toml".source = ../../dots/starship/starship.toml;
}
