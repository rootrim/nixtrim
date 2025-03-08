{pkgs, ...}:
{
  users.groups.docker = {};
  users.users.rootrim = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "rootrim";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      lolcat
    ];
  };
}
