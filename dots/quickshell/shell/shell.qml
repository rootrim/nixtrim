import Quickshell // for PanelWindow
import QtQuick // for Text

PanelWindow {
    anchors {
        top: true
        right: true
        bottom: true
    }

    implicitWidth: 100

    Text {
        // center the bar in its parent component (the window)
        anchors.centerIn: parent

        text: "hello world"
    }
}
