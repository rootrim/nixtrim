import qs
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

Rectangle {
  id: volumeBox
  Layout.alignment: Qt.AlignCenter
  Layout.preferredWidth: 40
  Layout.preferredHeight: 40
  color: Globals.base01
  radius: Globals.defaultRadius
  border.color: Globals.base03
  border.width: 2

  property PwNode sink: Pipewire.defaultAudioSink
  property real volume: sink?.audio ? Math.round(sink.audio.volume * 100) : 0
  property bool muted: sink?.audio ? sink.audio.muted : false

  PwObjectTracker {
    objects: [volumeBox.sink]
  }

  Text {
    anchors.centerIn: parent
    font.family: Globals.fontFamily
    font.pointSize: Globals.fontSize
    font.bold: true
    color: Globals.base07
    text: parent.muted ? "XX" : parent.volume.toString()
  }

  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton
    onClicked: {
      if (volumeBox.sink?.audio && volumeBox.sink.ready)
        volumeBox.sink.audio.muted = !volumeBox.sink.audio.muted;
    }
    onWheel: wheel => {
      if (!volumeBox.sink?.audio || !volumeBox.sink.ready)
        return;
      const delta = wheel.angleDelta.y > 0 ? 0.05 : -0.05;
      volumeBox.sink.audio.volume = Math.max(0, Math.min(1, volumeBox.sink.audio.volume + delta));
    }
  }
}
