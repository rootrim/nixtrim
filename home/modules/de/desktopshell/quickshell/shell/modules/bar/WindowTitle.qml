import QtQuick
import QtQuick.Layouts
import qs

Rectangle {
  id: root
  Layout.alignment: Qt.AlignCenter
  Layout.preferredWidth: 40
  Layout.preferredHeight: child.implicitWidth + 20
  color: Globals.base01
  radius: Globals.defaultRadius
  border.color: Globals.base03
  border.width: 2

  clip: true

  property string currentText: Funcs.cropText(Funcs.getActiveToplevel(), 30)

  onCurrentTextChanged: {
    outAnim.start();
  }

  Text {
    id: child
    anchors.centerIn: parent
    font.family: Globals.fontFamily
    font.pointSize: Globals.fontSize
    font.bold: false
    color: Globals.base07
    rotation: 90
    opacity: 1

    SequentialAnimation {
      id: outAnim
      NumberAnimation {
        target: child
        property: "anchors.verticalCenterOffset"
        to: -root.height
        duration: 120
        easing.type: Easing.InQuad
      }
      ScriptAction {
        script: {
          child.text = root.currentText;
          inAnim.start();
        }
      }
    }

    NumberAnimation {
      id: inAnim
      target: child
      property: "anchors.verticalCenterOffset"
      from: root.height
      to: 0
      duration: 120
      easing.type: Easing.OutQuad
    }
  }

  Component.onCompleted: {
    child.text = root.currentText;
  }
}
