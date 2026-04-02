pragma ComponentBehavior: Bound
import qs
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell

Repeater {
  model: SystemTray.items
  required property var panel

  delegate: Rectangle {
    id: root
    required property SystemTrayItem modelData
    Layout.alignment: Qt.AlignCenter
    Layout.preferredWidth: 40
    Layout.preferredHeight: 40

    color: Globals.base01
    border.color: mouseArea.containsMouse ? Globals.base0D : Globals.base02
    border.width: 2
    radius: Globals.defaultRadius

    Image {
      anchors.centerIn: parent
      width: 24
      height: 24
      source: root.modelData.icon
      fillMode: Image.PreserveAspectFit
    }

    QsMenuAnchor {
      id: menuAnchor
      anchor.window: root.QsWindow.window
      menu: root.modelData.menu
      anchor.rect.x: root.x
      anchor.rect.y: root.y - 400
      anchor.rect.width: root.width
      anchor.rect.height: root.height
    }

    MouseArea {
      id: mouseArea
      anchors.fill: parent
      acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
      hoverEnabled: true

      onClicked: mouse => {
        if (mouse.button === Qt.LeftButton) {
          root.modelData.activate();
        } else if (mouse.button === Qt.RightButton) {
          menuAnchor.open();
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
