{
  flake.homeModules.ssh = {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings."codeberg.org" = {
        HostName = "codeberg.org";
	User = "git";
        IdentityFile = "~/.ssh/codeberg_ssh_key";
        IdentitiesOnly = true;
      };
    };
  };
}
