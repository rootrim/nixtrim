{
  flake.nixosModules.ly = {pkgs, ...}: {
    services.displayManager = {
      ly = {
        enable = true;
        package = pkgs.ly;
        settings = {
          animation = "matrix";
          animation_frame_delay = 5;
          animation_timeout_sec = 0;
          cmatrix_fg = "0x0000FF00";
          cmatrix_head_col = "0x01FFFFFF";
          cmatrix_min_codepoint = "0x21";
          cmatrix_max_codepoint = "0x7B";
          auth_fails = 1;
          session_log = null;
        };
      };
    };
  };
}
