import qs
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  id: batteryBox
  Layout.alignment: Qt.AlignCenter
  Layout.preferredWidth: 40
  Layout.preferredHeight: 40
  color: level <= 20 ? Globals.base08 : Globals.base01
  radius: Globals.defaultRadius
  border.color: charging ? Globals.base0B : level <= 20 ? Globals.base08 : Globals.base03
  border.width: 2

  property int level: 100
  property bool charging: false

  Process {
    id: batteryProcess
    command: ["sh", "-c", "echo $(cat /sys/class/power_supply/BAT1/capacity):$(cat /sys/class/power_supply/BAT1/status)"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        const parts = this.text.trim().split(":");
        batteryBox.level = parseInt(parts[0]) || 0;
        batteryBox.charging = parts[1] === "Charging" || parts[1] === "Full";
      }
    }
  }

  Timer {
    interval: 5000
    running: true
    repeat: true
    onTriggered: batteryProcess.running = true
  }

  Text {
    anchors.centerIn: parent
    font.family: Globals.fontFamily
    font.pointSize: Globals.fontSize
    font.bold: true
    color: parent.charging ? Globals.base0B : parent.level <= 20 ? Globals.base08 : Globals.base07
    text: parent.level.toString()
  }
}
