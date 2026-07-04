import qs
import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

Scope {
  id: root
  NotificationServer {
    id: server
    actionsSupported: true
    bodySupported: true
    imageSupported: true

    onNotification: n => {
      n.tracked = true;
    }
  }

  PanelWindow {
    anchors {
      top: true
      right: true
    }

    margins {
      top: 10
      right: 10
    }

    color: "transparent"

    implicitWidth: 380
    implicitHeight: Math.max(1, column.implicitHeight)

    // exclusionMode: ExclusionMode.Ignore

    ColumnLayout {
      id: column
      anchors.fill: parent
      spacing: 10

      Repeater {
        model: server.trackedNotifications

        delegate: Rectangle {
          id: card
          required property var modelData

          Layout.fillWidth: true
          Layout.preferredHeight: layout.implicitHeight + 20
          color: Globals.base00
          border.width: 2
          border.color: modelData.urgency === NotificationUrgency.Critical ? Globals.base08 : Globals.base0D

          MouseArea {
            anchors.fill: parent
            onClicked: card.modelData.dismiss()
          }

          Timer {
            running: card.modelData.urgency !== NotificationUrgency.Critical
            interval: 4000
            onTriggered: card.modelData.dismiss()
          }

          RowLayout {
            id: layout
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            Image {
              Layout.preferredHeight: 36
              Layout.preferredWidth: 36
              Layout.alignment: Qt.AlignTop
              visible: source.toString() !== ""
              source: card.modelData.image || card.modelData.appIcon || ""
            }

            ColumnLayout {

              Layout.fillWidth: true
              spacing: 2

              Text {
                Layout.fillWidth: true
                text: card.modelData.summary
                color: Globals.base06
                font.pixelSize: Globals.fontSize
                font.family: Globals.fontFamily
                font.bold: true
                elide: Text.ElideRight
              }

              Text {
                Layout.fillWidth: true
                visible: text !== ""
                text: card.modelData.body
                color: Globals.base07
                font.pixelSize: Globals.fontSize - 1
                font.family: Globals.fontFamily
                wrapMode: Text.WordWrap
              }
            }
          }
        }
      }
    }
  }
}
