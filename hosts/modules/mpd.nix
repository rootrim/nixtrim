{
  username,
  ...
}:

let
  musicDir = "/home/${username}/Music";
in
{
  services.mpd = {
    enable = true;
    user = username;
    musicDirectory = musicDir;
  };
}
