{
  flake.nixosModules.usersRootrim = {pkgs, ...}: {
    users.users.rootrim = {
      shell = pkgs.fish;
      isNormalUser = true;
      description = "The Ultimate Life Form";
      extraGroups = [
        "dialout"
        "input"
        "networkmanager"
        "plugdev"
        "uucp"
        "video"
        "wheel"
      ];
    };
  };
}
