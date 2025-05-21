{
  config,
  pkgs,
  username,
  ...
}:

let
  musicDir = "/home/${username}/Music";
  mpdDir = "/home/${username}/.config/mpd";
in
{
  services.mpd = {
    enable = true;
    user = username;
    musicDirectory = musicDir;
    dbFile = "${mpdDir}/database";
    playlistDirectory = "${mpdDir}/playlists";
    extraConfig = ''
      state_file "/home/${username}/.config/mpd/state"

      audio_output {
        type "pipewire"
        name "Pipewire Output"
      }
    '';
  };
}
