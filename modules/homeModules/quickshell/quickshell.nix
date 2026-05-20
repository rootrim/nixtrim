{self, ...}: {
  flake.homeModules.quickshell = {pkgs, ...}: {
    home.packages = with pkgs; [
      qt6.qtimageformats
      qt6.qt5compat
      qt6.qtmultimedia
      qt6.qtdeclarative
      quickshell
      grim
      imagemagick
    ];

    xdg.configFile."quickshell/modules".source = ./shell/modules;
    xdg.configFile."quickshell/Funcs.qml".source = ./shell/Funcs.qml;
    xdg.configFile."quickshell/ReloadPopup.qml".source = ./shell/ReloadPopup.qml;
    xdg.configFile."quickshell/shell.qml".source = ./shell/shell.qml;
    xdg.configFile."quickshell/Globals.qml".text = ''
      pragma Singleton
      import QtQuick

      QtObject {
        property int defaultRadius: 0
        property int defaultBorderSize: 5
        property string fontFamily: "Maple Mono NF"
        property int fontSize: 13
        property color base00: "${self.theme.base00}"
        property color base01: "${self.theme.base01}"
        property color base02: "${self.theme.base02}"
        property color base03: "${self.theme.base03}"
        property color base04: "${self.theme.base04}"
        property color base05: "${self.theme.base05}"
        property color base06: "${self.theme.base06}"
        property color base07: "${self.theme.base07}"
        property color base08: "${self.theme.base08}"
        property color base09: "${self.theme.base09}"
        property color base0A: "${self.theme.base0A}"
        property color base0B: "${self.theme.base0B}"
        property color base0C: "${self.theme.base0C}"
        property color base0D: "${self.theme.base0D}"
        property color base0E: "${self.theme.base0E}"
        property color base0F: "${self.theme.base0F}"
      }
    '';
  };
}
