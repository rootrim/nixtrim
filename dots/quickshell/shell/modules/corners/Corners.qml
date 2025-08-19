import qs
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland

Scope {
  id: screenCorners
  readonly property Toplevel activeWindow: ToplevelManager.activeToplevel

  component CornerPanelWindow: PanelWindow {
    id: cornerPanelWindow
    visible: true
    default property var corner
    property var cornerColor: "#000000"

    exclusionMode: ExclusionMode.Ignore
    mask: Region {
      item: null
    }
    WlrLayershell.namespace: "quickshell:screenCorners"
    WlrLayershell.layer: WlrLayer.Overlay
    color: "transparent"

    anchors {
      top: cornerPanelWindow.corner === RoundCorner.CornerEnum.TopLeft || cornerPanelWindow.corner === RoundCorner.CornerEnum.TopRight
      left: cornerPanelWindow.corner === RoundCorner.CornerEnum.TopLeft || cornerPanelWindow.corner === RoundCorner.CornerEnum.BottomLeft
      bottom: cornerPanelWindow.corner === RoundCorner.CornerEnum.BottomLeft || cornerPanelWindow.corner === RoundCorner.CornerEnum.BottomRight
      right: cornerPanelWindow.corner === RoundCorner.CornerEnum.TopRight || cornerPanelWindow.corner === RoundCorner.CornerEnum.BottomRight
    }

    implicitWidth: cornerWidget.implicitWidth
    implicitHeight: cornerWidget.implicitHeight

    RoundCorner {
      id: cornerWidget
      implicitSize: Globals.defaultRadius
      corner: cornerPanelWindow.corner
      color: cornerPanelWindow.cornerColor
    }
  }

  Variants {
    model: Quickshell.screens

    Scope {
      id: monitorScope
      required property var modelData

      CornerPanelWindow {
        screen: monitorScope.modelData
        corner: RoundCorner.CornerEnum.TopLeft
      }
      CornerPanelWindow {
        screen: monitorScope.modelData
        corner: RoundCorner.CornerEnum.TopRight
      }
      CornerPanelWindow {
        screen: monitorScope.modelData
        corner: RoundCorner.CornerEnum.BottomLeft
      }
      CornerPanelWindow {
        screen: monitorScope.modelData
        corner: RoundCorner.CornerEnum.BottomRight
      }
    }
  }
}
