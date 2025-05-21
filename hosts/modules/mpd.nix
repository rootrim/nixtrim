{
  username,
  ...
}:

{
  services.mpd = {
    enable = true;
    user = username;
  };
}
