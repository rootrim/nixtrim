{
  flake.homeModules.fsel = {
    home.file.".config/fsel/config.toml".text =
      #toml
      ''
        # Colors
        highlight_color = "LightBlue"
        cursor = "█"

        # App launcher
        terminal_launcher = "kitty -1e"

        [app_launcher]
        filter_desktop = true              # Filter apps by desktop environment
        list_executables_in_path = false   # Show CLI tools from $PATH
        hide_before_typing = false         # Hide list until you start typing
        match_mode = "fuzzy"               # "fuzzy" or "exact"
        confirm_first_launch = false       # Confirm before launching new apps with -p
        prefix_depth = 3                   # Character depth for prefix matching priority

        # Pin/favorite settings
        pin_color = "rgb(255,165,0)"       # Color for pin icon (orange)
        pin_icon = "📌"                     # Icon for pinned apps
      '';
  };
}
