{
  flake.homeModules.hyprland = {
    lib,
    pkgs,
    config,
    ...
  }: let
    c = config.lib.stylix.colors;
  in {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      xwayland.enable = true;
      systemd.enable = true;

      settings = {
        monitor = "eDP-1,1920x1080@120.00200,0x0,1";

        # General
        general = {
          gaps_in = 10;
          gaps_out = 40;
          border_size = 3;
          "col.active_border" = lib.mkForce "rgb(${c.base01})";
          "col.inactive_border" = lib.mkForce "rgb(${c.base01})";
          allow_tearing = true;
          layout = "dwindle";
          snap.enabled = true;
        };

        misc = {
          force_default_wallpaper = -1;
          disable_hyprland_logo = true;
        };

        # Decoration
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

        # Animations
        animations = {
          enabled = true;

          bezier = ["smooth, 0.45, 0,     0.55, 1" "swift,  0.77, 0,     0.18, 1"];

          animation = [
            "windows,          1, 1.3,  smooth, slide"
            "windowsOut,       1, 1,    smooth, slide"
            "fade,             1, 3,    smooth"
            "workspaces,       1, 3,    swift,  slidefadevert 15%"
            "specialWorkspace, 1, 3,    smooth, slidevert"
          ];
        };

        # Layouts
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master.new_status = "child";

        # Input / Devices
        input = {
          kb_layout = "tr";
          kb_options = "caps:swapescape";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad.natural_scroll = false;
        };

        cursor.no_hardware_cursors = false;

        # Debug
        debug.disable_logs = false;

        # Startup
        exec-once = [
          "quickshell"
          "cclipd -s 2 -t 'image/png' -t 'image/*' -t 'text/plain;charset=utf-8' -t 'text/*' -t '*'"
          # "hyprctl setcursor Bibata-Modern-Ice 24"
          "hyprshade on vibrance"
          "${lib.getExe pkgs.hyprpaper}"
          "${lib.getExe pkgs.hyprpolkitagent}"
        ];

        # Binds
        "$mainMod" = "SUPER";
        "$subMod" = "ALT";
        "$terminal" = "kitty -1";
        "$fsel" = "kitten quick-access-terminal fsel -d";
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

        # Window Rules
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
          ", catchall, submap, reset"
        ];
      };
    };
  };
}
