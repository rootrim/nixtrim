{
  config,
  pkgs,
  username,
  ...
}:

{
  services.mpd = {
    enable = true;
    user = username;
    musicDirectory = "/home/${username}/Music";
    extraConfig = ''
      db_file "/home/${username}/.config/mpd/database"
      state_file "/home/${username}/.config/mpd/state"
      playlist_directory "/home/${username}/.config/mpd/playlists"

      audio_output {
        type "pipewire"
        name "Pipewire Output"
      }
    '';
  };
}
