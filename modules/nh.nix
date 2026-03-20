{username, ...}: {
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.dates = "daily";
    clean.extraArgs = "--keep-since 4d --keep 3 --optimise";
    flake = "/home/${username}/.config/nixtrim/";
  };
}
