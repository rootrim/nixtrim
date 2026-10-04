let
  theme = {
    base00 = "#1F1F28";
    base01 = "#16161D";
    base02 = "#223249";
    base03 = "#54546D";
    base04 = "#727169";
    base05 = "#DCD7BA";
    base06 = "#C8C093";
    base07 = "#717C7C";
    base08 = "#C34043";
    base09 = "#FFA066";
    base0A = "#C0A36E";
    base0B = "#76946A";
    base0C = "#6A9589";
    base0D = "#7E9CD8";
    base0E = "#957FB8";
    base0F = "#D27E99";
    fg = theme.base05;
  };

  stripHash = str:
    if builtins.substring 0 1 str == "#"
    then builtins.substring 1 (builtins.stringLength str - 1) str
    else str;

  themeNoHash = builtins.mapAttrs (_: v: stripHash v) theme;
in {
  flake = {
    inherit theme themeNoHash;
  };
}
