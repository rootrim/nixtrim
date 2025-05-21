{
  username,
  config,
  lib,
  pkgs,
  ...
}:

let
  musicDir = "/home/${username}/Music";
  mpdDir = "/home/${username}/.config/mpd";
in
{
  services.mpd = {
    enable = true;
    musicDirectory = musicDir;
    extraConfig = ''
      db_file "${mpdDir}/database"
      state_file "${mpdDir}/state"
      playlist_directory "${mpdDir}/playlists"

      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
