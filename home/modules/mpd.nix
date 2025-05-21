{ config, username, ... }:
{
  services.mpd = {
    enable = true;
    user = username;
    musicDirectory = "/home/${username}/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.${username}.uid}";
  };
}
