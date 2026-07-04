import qs
import QtQuick
import QtQuick.Layouts
import Quickshell

Rectangle {
  Layout.alignment: Qt.AlignCenter
  color: "transparent"
  implicitWidth: clockText.implicitWidth
  implicitHeight: clockText.implicitHeight

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  Text {
    id: clockText
    anchors.centerIn: parent
    font.family: Globals.fontFamily
    font.pointSize: Globals.fontSize
    font.bold: false
    color: Globals.base07
    horizontalAlignment: Text.AlignHCenter
    text: Qt.formatDateTime(clock.date, "hh\nmm\nss")
  }
}
