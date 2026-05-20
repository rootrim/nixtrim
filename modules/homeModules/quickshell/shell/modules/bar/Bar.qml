pragma ComponentBehavior: Bound
import qs
import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    LazyLoader {
      id: barLoader
      active: true
      required property var modelData
      component: PanelWindow {
        id: bar
        screen: barLoader.modelData
        color: "transparent"

        anchors {
          top: true
          right: true
          bottom: true
        }

        margins {
          top: 40
          right: 40
          bottom: 40
        }

        implicitWidth: 48
        ColumnLayout {
          anchors.fill: parent

          spacing: 5

          Workspaces {}

          WindowTitle {}

          Spacer {}

          Tray {
            panel: parent
          }

          Net {}

          Volume {}

          Battery {}

          Clock {}
        }
      }
    }
  }
}
