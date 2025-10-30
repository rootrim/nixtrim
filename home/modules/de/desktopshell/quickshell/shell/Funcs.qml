pragma Singleton
import QtQuick
import Quickshell.Hyprland

QtObject {
  function toKanji(id) {
    const kanji = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十"];
    return kanji[id - 1] || id.toString();
  }
  function cropText(text, maxLength) {
    if (text.length <= maxLength)
      return text;
    return text.slice(0, maxLength - 3) + "...";
  }
  function getActiveToplevel() {
    let focusedWorkspace = Hyprland.focusedWorkspace;
    if (!focusedWorkspace) {
      return "No Workspace";
    }
    let toplevels = focusedWorkspace.toplevels;
    let focusedWindow = toplevels.values.find(toplevel => toplevel.activated);
    if (focusedWindow) {
      return focusedWindow.title;
    } else {
      return "Desktop";
    }
  }
}
