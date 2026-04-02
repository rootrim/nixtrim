import qs
import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
  Layout.alignment: Qt.AlignCenter
  Layout.preferredWidth: 40
  Layout.preferredHeight: 80
  color: Globals.base01
  radius: Globals.defaultRadius
  border.color: Globals.base03
  border.width: 2
  property var clock: SystemClock {
    precision: SystemClock.Seconds
  }

  Text {
    anchors.centerIn: parent
    font.family: Globals.fontFamily
    font.pointSize: Globals.fontSize
    font.bold: true
    color: Globals.base07
    text: Qt.formatDateTime(parent.clock.date, "hh\nmm\nss")
  }
}
