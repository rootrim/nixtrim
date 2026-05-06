{
  flake.homeModules.havoc = {pkgs, ...}: {
    programs.havoc = {
      enable = true;
      settings = {
        child.program = "fish";
        terminal = {
          "scroll to bottom on input" = "yes";
        };
        font.path = "${pkgs.maple-mono.NF}/share/fonts/truetype/MapleMono/MapleMono-NF-Regular.ttf";
      };
    };
  };
}
