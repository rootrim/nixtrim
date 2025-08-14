pragma ComponentBehavior: Bound
import qs
import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  Rectangle {
    width: 400
    height: 400

    Component.onCompleted: {
      for (const workspace of Hyprland.workspaces.values) {
        console.log(workspace.id);
      }
    }
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  Variants {
    model: Quickshell.screens

    delegate: Component {
      PanelWindow {
        required property var modelData
        screen: modelData
        color: Globals.base00

        anchors {
          top: true
          right: true
          bottom: true
        }

        implicitWidth: 45

        ColumnLayout {
          anchors.fill: parent

          Workspaces {}

          Item {
            Layout.fillHeight: true
          }
          Rectangle {
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 40
            Layout.preferredHeight: 80
            color: Globals.base01
            radius: Globals.defaultRadius
            border.color: Globals.base02
            border.width: 2

            Text {
              anchors.centerIn: parent
              font.family: Globals.fontFamily
              font.pointSize: Globals.fontSize
              font.bold: true
              color: Globals.base07
              text: Qt.formatDateTime(clock.date, "hh\nmm\nss")
            }
          }
        }
      }
    }
  }
}
