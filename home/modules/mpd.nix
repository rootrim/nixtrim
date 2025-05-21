{
  username,
  ...
}:

let
  musicDir = "/home/${username}/Music";
in

{
  home.file.".config/mpd/mpd.conf".source = ../../dots/mpd/mpd.conf;

  services.mpd = {
    musicDirectory = musicDir;
    enable = true;
  };
}
