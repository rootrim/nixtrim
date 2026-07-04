import qs
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: root
  color: "transparent"
  Layout.alignment: Qt.AlignCenter
  implicitWidth: Math.max(iconText.implicitWidth, volumeText.implicitWidth) + 4
  implicitHeight: iconText.implicitHeight + volumeText.implicitHeight

  property PwNode sink: Pipewire.defaultAudioSink
  property int volume: sink?.audio ? Math.round(sink.audio.volume * 100) : 0
  property bool muted: sink?.audio?.muted ?? false

  PwObjectTracker {
    objects: [root.sink]
  }

  ColumnLayout {
    anchors.centerIn: parent
    spacing: 0
    Text {
      id: iconText
      font.family: Globals.fontFamily
      Layout.alignment: Qt.AlignHCenter
      text: ""
      font.pointSize: Globals.fontSize - 4
      color: Globals.base0D
    }
    Text {
      id: volumeText
      font.family: Globals.fontFamily
      Layout.alignment: Qt.AlignHCenter
      text: root.muted ? "XX" : root.volume === 100 ? "00" : root.volume.toString()
      font.pointSize: Globals.fontSize
      color: Globals.base07
    }
  }
}
