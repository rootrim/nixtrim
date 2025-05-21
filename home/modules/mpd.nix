{ username, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/${username}/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
}
