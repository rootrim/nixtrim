{
  flake.homeModules.git = {
    programs.git = {
      enable = true;
      settings = {
	commit.gpgSign = true;
	credential.helper = "store";
	gpg.format = "ssh";
	gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
	pull.rebase = true;
	user.email = "jonitrium@noreply.codeberg.org";
	user.signingKey = "~/.ssh/codeberg_ssh_key";
        color.ui = "auto";
        core.editor = "nvim";
        init.defaultBranch = "master";
        push.autoSetupRemote = true;
        user.name = "jonitrium";
      };
    };
    home.file.".ssh/allowed_signers".text = "jonitrium@noreply.codeberg.org ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIJjJYrckq1RoREDKkwDNWO3wubjXZjCNbajU+/A8A/B rootrim@zenith\n";
  };
}
