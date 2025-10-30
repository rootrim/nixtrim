import QtQuick
import QtQuick.Layouts
import qs

Rectangle {
  Layout.alignment: Qt.AlignCenter
  Layout.preferredWidth: 40
  Layout.preferredHeight: child.width + 20
  color: Globals.base01
  radius: Globals.defaultRadius
  border.color: Globals.base03
  border.width: 2
  Text {
    id: child
    anchors.centerIn: parent
    font.family: Globals.fontFamily
    font.pointSize: Globals.fontSize
    font.bold: false
    color: Globals.base07
    text: Funcs.cropText(Funcs.getActiveToplevel(), 20)
    rotation: 90
  }
}
