pragma ComponentBehavior: Bound
import qs
import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: root
      required property var modelData
      screen: modelData

      anchors {
        top: true
        right: true
        bottom: true
      }

      implicitWidth: 40
      color: Globals.base00

      ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 8
        anchors.bottomMargin: 8

        Workspaces {}

        Item {
          Layout.fillHeight: true
        }

        Tray {}
        Network {}
        Volume {}
        Battery {}
        Clock {}
      }
    }
  }
}
