pragma ComponentBehavior: Bound
import qs
import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

  // Rectangle {
  //   width: 400
  //   height: 400
  //
  //   Component.onCompleted: {
  //     // for (const workspace of Hyprland.workspaces.values) {
  //     //   for (const toplevel of workspace.toplevels.values) {
  //     //     console.log(workspace.id, toplevel.title, toplevel.activated);
  //     //   }
  //     // }
  //     console.log(Funcs.getActiveToplevel());
  //   }
  // }

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

        implicitWidth: 48
        ColumnLayout {
          anchors.fill: parent

          spacing: 5

          Item {}

          Workspaces {}

          WindowTitle {}

          Spacer {}

          Tray {
            panel: parent
          }

          Battery {}

          Clock {}

          Item {}
        }
      }
    }
  }
}
