{
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
    musicDirectory = musicDir;
    dataDir = mpdDir;
    dbFile = "${mpdDir}/database";
    playlistDirectory = "${mpdDir}/playlists";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
