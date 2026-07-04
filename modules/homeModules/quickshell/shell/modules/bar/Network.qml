import qs
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: root
  color: "transparent"
  Layout.alignment: Qt.AlignCenter
  implicitWidth: wifiSymbol.implicitWidth
  implicitHeight: wifiSymbol.implicitHeight

  property var devices: Networking.devices.values ?? []
  property var connectedDevice: devices.find(d => d.connected)
  property bool isCabled: connectedDevice !== undefined && !("networks" in connectedDevice)
  property var connectedNetwork: connectedDevice?.networks.values.find(n => n.connected)

  Text {
    id: wifiSymbol
    anchors.centerIn: parent
    font.family: Globals.fontFamily
    font.pointSize: Globals.fontSize
    font.bold: false
    color: Globals.base07
    text: {
      if (root.isCabled) {
        return "";
      }
      const strength = root.connectedNetwork?.signalStrength ?? 67; // OMG SIX SEVEN!??!
      const bucket = Math.floor(strength * 4);
      switch (bucket) {
      case 0:
        return "󰤯";
      case 1:
        return "󰤟";
      case 2:
        return "󰤢";
      case 3:
        return "󰤥";
      case 4:
        return "󰤨";
      default:
        return "󰤭";
      }
    }
  }
}
