{ lib, ... }:
let
  c = {
    background = "rgb(282828)";
    backgroundAlpha = "282828";
    foreground = "rgb(ebdbb2)";
    foregroundAlpha = "ebdbb2";
    color0 = "rgb(3c3836)";
    color0Alpha = "3c3836";
    color1 = "rgb(cc241d)";
    color2 = "rgb(98971a)";
    color3 = "rgb(d79921)";
    color4 = "rgb(458588)";
    color5 = "rgb(b16286)";
    color6 = "rgb(689d6a)";
    color7 = "rgb(a89984)";
    color8 = "rgb(928374)";
    color9 = "rgb(fb4934)";
    color10 = "rgb(b8bb26)";
    color11 = "rgb(fabd2f)";
    color12 = "rgb(83a598)";
    color13 = "rgb(d3869b)";
    color14 = "rgb(8ec07c)";
    color14Alpha = "8ec07c";
    color15 = "rgb(fbf1c7)";
  };
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      monitor = "eDP-1,1920x1080@120.00200,0x0,1";

      # ── General ─────────────────────────────────────────────────────────
      general = {
        gaps_in = 10;
        gaps_out = 40;
        border_size = 3;
        "col.active_border" = lib.mkForce c.color0;
        "col.inactive_border" = lib.mkForce c.color0;
        allow_tearing = true;
        layout = "dwindle";
        snap.enabled = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
      };

      # ── Decoration ──────────────────────────────────────────────────────
      decoration = {
        rounding = 10;
        active_opacity = 0.9;
        inactive_opacity = 0.8;

        shadow = {
          enabled = true;
          range = 3;
          render_power = 3;
          color = lib.mkForce "rgba(0,0,0,0.6)";
          offset = "4 4";
          scale = 1.0;
        };

        blur = {
          enabled = true;
          size = 7;
          passes = 3;
          ignore_opacity = true;
          new_optimizations = true;
        };
      };

      # ── Animations ──────────────────────────────────────────────────────
      animations = {
        enabled = true;

        bezier = [
          "smooth, 0.45, 0,     0.55, 1" # simetrik ease, fade/border için
          "swift,  0.77, 0,     0.18, 1" # hızlı başlar, workspace için
        ];

        animation = [
          "windows,          1, 1.3,  smooth, slide"
          "windowsOut,       1, 1,    smooth, slide"
          "fade,             1, 3,    smooth"
          "workspaces,       1, 3,    swift,  slidefadevert 15%"
          "specialWorkspace, 1, 4,    smooth, slidevert"
        ];
      };

      # ── Layouts ─────────────────────────────────────────────────────────
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master.new_status = "child";

      # ── Input / Devices ─────────────────────────────────────────────────
      input = {
        kb_layout = "tr";
        kb_options = "caps:swapescape";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = false;
      };

      cursor.no_hardware_cursors = false;

      # ── Debug ───────────────────────────────────────────────────────────
      debug.disable_logs = false;

      # ── Startup ─────────────────────────────────────────────────────────
      exec-once = [
        "/usr/lib/polkit-kde-authentication-agent-1"
        "quickshell"
        "hypridle"
        "swww-daemon & swww restore"
        ''
          cclipd -s 2 -t "image/png" -t "image/*" -t "text/plain;charset=utf-8" -t "text/*" -t "*"''
        "hyprctl setcursor Bibata-Modern-Ice 24"
        "hyprshade on vibrance"
      ];

      env = [
        "MOZ_ENABLE_WAYLAND,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      # ── Binds ───────────────────────────────────────────────────────────
      "$mainMod" = "SUPER";
      "$subMod" = "ALT";
      "$terminal" = "kitty";
      "$fsel" = "$terminal --title launcher -e fsel -d";
      "$menu" = "$fsel";
      "$clipboard" = "$fsel --cclip";

      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, BACKSPACE, killactive,"
        "$mainMod, TAB, togglefloating,"
        "$mainMod, V, pseudo,"
        "$mainMod, U, exec, hyprpicker | wl-copy"
        ", Print, exec, hyprshot -m region -z"
        "SHIFT, Print, exec, hyprshot -m window -z"
        "$mainMod, R, exec, $menu"
        "$mainMod, E, exec, rofimoji"
        "$mainMod, F, fullscreen"
        "$mainMod, C, exec, $clipboard"
        # focus
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        # move
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"
        # workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # move to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # special workspace
        "$mainMod, S, togglespecialworkspace, hyprspace"
        "$mainMod SHIFT, S, movetoworkspace, special:hyprspace"
        # submap
        "$subMod, R, submap, resize"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
        "$mainMod, Right, exec, playerctl next"
        "$mainMod, Left, exec, playerctl previous"
        "$mainMod, Down, exec, playerctl play-pause"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # ── Window Rules ────────────────────────────────────────────────────
      windowrule = [
        "float 1,        match:title ^launcher$"
        "size 800 600,   match:title ^launcher$"
        "center 1,       match:title ^launcher$"
        "workspace special:hyprspace, match:initial_class steam"
      ];
    };

    submaps.resize.settings = {
      binde = [
        ", H, resizeactive, 10 0"
        ", L, resizeactive, -10 0"
        ", K, resizeactive, 0 -10"
        ", J, resizeactive, 0 10"
      ];
      bind = [ ", catchall, submap, reset" ];
    };
  };
}
