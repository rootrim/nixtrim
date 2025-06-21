import { bind } from "astal"
import HyprlandService from "gi://AstalHyprland"


export default function Workspaces() {

  const hyprland = HyprlandService.get_default()

  return <box className="Workspaces" vertical={true} spacing={4}>
    {bind(hyprland, "workspaces").as(wss => wss
      .filter(ws => !(ws.id >= -99 && ws.id <= -2)) // filter out special workspaces
      .sort((a, b) => a.id - b.id)
      .map(ws => (
        <button
          className={bind(hyprland, "focusedWorkspace").as(fw =>
            ws === fw ? "focused" : "")}
          onClicked={() => ws.focus()}>
          {numToKanji(ws.id - 1)}
        </button>
      ))
    )}
  </box>
}

function numToKanji(num: number): string {
  const kanjiNumbers = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十"];
  if (num < 0 || num >= kanjiNumbers.length) {
    return "?"; // Handle out of range
  }
  return kanjiNumbers[num];
}
