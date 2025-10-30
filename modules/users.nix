{ pkgs, ... }:
{
  users.groups.docker = { };
  users.users.rootrim = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "rootrim";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "dialout"
    ];
    packages = with pkgs; [
      lolcat
    ];
  };
}
