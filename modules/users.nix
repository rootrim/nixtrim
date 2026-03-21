{pkgs, ...}: {
  users.users.rootrim = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "The Ultimate Life Form";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "input"
      "video"
      "plugdev"
    ];
  };
}
