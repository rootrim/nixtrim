import qs
import Quickshell
import Quickshell.Hyprland
import QtQuick

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: root
      property var modelData
      screen: modelData
      color: Globals.base00

      anchors {
        top: true
        left: true
      }

      implicitWidth: wname.implicitWidth + 16
      implicitHeight: wname.implicitHeight + 6

      Text {
        id: wname
        anchors.centerIn: parent
        font.family: Globals.fontFamily
        font.pointSize: Globals.fontSize - 2
        color: Globals.base07
        text: Funcs.getActiveToplevel()
      }
    }
  }
}
