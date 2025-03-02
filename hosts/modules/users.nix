{pkgs, ...}:
{
  users.users.rootrim = {
    isNormalUser = true;
    description = "rootrim";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      lolcat
    ];
  };
}
