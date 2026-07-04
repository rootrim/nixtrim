import qs
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: root
  color: "transparent"
  Layout.alignment: Qt.AlignCenter
  implicitWidth: Math.max(iconText.implicitWidth, batteryText.implicitWidth) + 4
  implicitHeight: iconText.implicitHeight + batteryText.implicitHeight

  property var device: UPower.displayDevice
  property int level: Math.round(device.percentage * 100)
  property bool charging: device.state === UPowerDeviceState.Charging

  ColumnLayout {
    anchors.centerIn: parent
    spacing: 0
    Text {
      id: iconText
      Layout.alignment: Qt.AlignHCenter
      text: ""
      font.pointSize: Globals.fontSize - 4
      color: Globals.base0D
    }
    Text {
      id: batteryText
      Layout.alignment: Qt.AlignHCenter
      font.family: Globals.fontFamily
      font.pointSize: Globals.fontSize
      font.bold: false
      color: root.level <= 20 && !root.charging ? Globals.base08 : Globals.base07
      text: root.level === 100 ? "00" : root.level.toString()
    }
  }
}
