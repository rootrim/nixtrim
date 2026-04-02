import qs
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Rectangle {
  id: netBox
  Layout.alignment: Qt.AlignCenter
  Layout.preferredWidth: 40
  Layout.preferredHeight: 40
  color: Globals.base01
  radius: Globals.defaultRadius
  border.color: Globals.base03
  border.width: 2

  property string ethState: ""
  property int wifiSignal: -1

  Process {
    id: ethProcess
    command: ["sh", "-c", "cat /sys/class/net/en*/operstate 2>/dev/null"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: netBox.ethState = this.text.trim().split("\n").some(s => s === "up" || s === "unknown") ? "up" : "down"
    }
  }

  Process {
    id: wifiProcess
    command: ["sh", "-c", "awk '/wlp49s0/{print $3}' /proc/net/wireless"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        const raw = this.text.trim().replace(".", "");
        netBox.wifiSignal = parseInt(raw) || -1;
      }
    }
  }

  Timer {
    interval: 5000
    running: true
    repeat: true
    onTriggered: {
      ethProcess.running = true;
      wifiProcess.running = true;
    }
  }

  Text {
    anchors.centerIn: parent
    font.family: Globals.fontFamily
    font.pointSize: 18
    font.bold: true
    color: Globals.base07
    text: {
      if (parent.ethState === "up")
        return "";
      if (parent.wifiSignal < 0)
        return "󰤯";
      if (parent.wifiSignal <= 25)
        return "󰤟";
      if (parent.wifiSignal <= 50)
        return "󰤢";
      if (parent.wifiSignal <= 70)
        return "󰤥";
      return "󰤨";
    }
  }
}
