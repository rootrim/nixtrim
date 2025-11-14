{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "kitty -e";
        width = 40;
        line-height = 28;
        show-actions = "yes";
        exit-on-keyboard-focus-loss = "yes";
        layer = "overlay";
        lines = 6;
        minimal-lines = true;
        x-margin = 10;
        y-margin = 10;
        icons-enabled = true;
      };
      border = {
        width = 3;
        radius = 10;
      };
    };
  };
}
