import qs
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Hyprland

Repeater {
  model: Hyprland.workspaces.values
  delegate: RoundButton {
    id: root
    required property var modelData
    Layout.alignment: Qt.AlignCenter
    Layout.preferredWidth: 40
    Layout.preferredHeight: 40
    visible: modelData.id > 0
    onClicked: modelData.activate()

    contentItem: Text {
      text: Funcs.toKanji(root.modelData.id)
      font {
        bold: true
        pointSize: Globals.fontSize
        family: Globals.fontFamily
      }
      opacity: enabled ? 1.0 : 0.3
      color: Globals.base07
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      elide: Text.ElideRight
    }
    background: Rectangle {
      implicitWidth: 40
      implicitHeight: 40
      color: Globals.base01
      opacity: enabled ? 1 : 0.3
      border.color: root.modelData.focused ? Globals.base0D : root.modelData.urgent ? Globals.base08 : Globals.base02
      border.width: root.modelData.focused ? 2 : 2
      radius: Globals.defaultRadius
    }
  }
}
