pragma ComponentBehavior: Bound
import qs
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

Repeater {
  model: SystemTray.items
  required property var panel

  delegate: Rectangle {
    id: root
    required property var modelData
    Layout.alignment: Qt.AlignCenter
    Layout.preferredWidth: 40
    Layout.preferredHeight: 40

    implicitWidth: 40
    implicitHeight: 40
    color: Globals.base01
    border.color: Globals.base02
    border.width: 2
    radius: Globals.defaultRadius
    Image {
      anchors.fill: parent
      source: root.modelData.icon
      fillMode: Image.PreserveAspectFit
    }

    MouseArea {
      anchors.fill: parent
      acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

      onClicked: mouse => {
        if (mouse.button === Qt.LeftButton) {
          root.modelData.activate();
        } else if (mouse.button === Qt.RightButton) {
          if (root.modelData.hasMenu) {
            root.modelData.display(root, mouseX, mouseY);
          }
        } else if (mouse.button === Qt.MiddleButton) {
          root.modelData.secondaryActivate();
        }
      }

      onWheel: wheel => {
        root.modelData.scroll(wheel.angleDelta.y, false);
      }
    }
  }
}
