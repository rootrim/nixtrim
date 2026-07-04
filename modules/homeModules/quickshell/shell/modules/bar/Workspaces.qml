import qs
import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ColumnLayout {
  id: root
  spacing: 4
  Layout.alignment: Qt.AlignCenter

  Repeater {
    model: ScriptModel {
      values: Hyprland.workspaces.values.filter(ws => ws.id > 0)
    }

    Rectangle {
      id: wsItem
      required property HyprlandWorkspace modelData
      Layout.alignment: Qt.AlignHCenter
      implicitWidth: wsText.implicitHeight
      implicitHeight: wsText.implicitHeight
      color: modelData.focused ? Globals.base0D : "transparent"
      border.width: 0

      Text {
        id: wsText
        anchors.centerIn: parent
        font.family: Globals.fontFamily
        font.pointSize: Globals.fontSize + 2
        color: wsItem.modelData.focused ? Globals.base00 : Globals.base07
        // text: Funcs.toKanji(wsItem.modelData.id.toString())
        text: Funcs.toKanji(wsItem.modelData.id)
      }
    }
  }
}
