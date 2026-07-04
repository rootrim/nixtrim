import qs
import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: root
      property var modelData
      property MprisPlayer player: Mpris.players.values[0] ?? null
      screen: modelData
      color: Globals.base00
      visible: root.player !== null

      anchors {
        bottom: true
        left: true
      }

      implicitWidth: Math.max(songName.implicitWidth, artistName.implicitWidth) + 16
      implicitHeight: songName.implicitHeight + artistName.implicitHeight + col.spacing + 4

      ColumnLayout {
        id: col
        anchors.centerIn: parent
        spacing: 0
        Text {
          id: artistName
          font.family: Globals.fontFamily
          font.pointSize: Globals.fontSize - 6
          font.bold: true
          color: Globals.base0D
          text: root.player ? `${root.player.trackArtist}` : ""
        }
        Text {
          id: songName
          font.family: Globals.fontFamily
          font.pointSize: Globals.fontSize - 4
          color: Globals.base07
          text: root.player ? root.player.trackTitle : ""
        }
      }
    }
  }
}
