import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

ColumnLayout {
  id: root
  spacing: 4
  Layout.alignment: Qt.AlignCenter

  Repeater {
    model: SystemTray.items

    Item {
      id: trayItem
      required property SystemTrayItem modelData
      Layout.alignment: Qt.AlignHCenter
      implicitWidth: 24
      implicitHeight: 24

      IconImage {
        anchors.fill: parent
        source: trayItem.modelData.icon
      }
    }
  }
}
