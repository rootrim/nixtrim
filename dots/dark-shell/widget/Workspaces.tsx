import { Gtk } from "astal/gtk3"
import HyprlandService from "gi://AstalHyprland"

const hyprland = HyprlandService.get_default()

export default function Workspaces() {
  return <box
    className='workspace'
    vertical={true}
    spacing={4}>
    {Array.from({ length: 5 }).map((_, i) =>
      <button
        className='button'
        cursor='pointer'
        halign={Gtk.Align.CENTER}
        onClick={() => hyprland.message(`dispatch workspace ${i + 1}`)}
        setup={(self) => {
          self.hook(hyprland, 'event', () => {
            self.toggleClassName('active', hyprland.get_focused_workspace().get_id() === i + 1)
          })
        }}>
        <label label={`${numToKanji(i)}`} />
      </button>
    )}
  </box>
}

function numToKanji(num: number): string {
  const kanjiNumbers = ["一", "二", "三", "四", "五"];
  return num.toString().split('').map(digit => kanjiNumbers[parseInt(digit)]).join('');
}
