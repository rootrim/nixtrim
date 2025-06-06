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
        }} />
    )}
  </box>
}
