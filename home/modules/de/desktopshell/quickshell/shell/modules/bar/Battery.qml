import qs
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  Layout.alignment: Qt.AlignCenter
  Layout.preferredWidth: 40
  Layout.preferredHeight: 40
  color: Globals.base01
  radius: Globals.defaultRadius
  border.color: Globals.base03
  border.width: 2

  Text {
    id: battery
    anchors.centerIn: parent
    font.family: Globals.fontFamily
    font.pointSize: Globals.fontSize
    font.bold: true
    color: Globals.base07

    Process {
      id: batteryProcess

      command: ["cat", "/sys/class/power_supply/BAT1/capacity"]
      running: true

      stdout: StdioCollector {
        onStreamFinished: battery.text = this.text.trim()
      }
    }

    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: batteryProcess.running = true
    }
  }
}
