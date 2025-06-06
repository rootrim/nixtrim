import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"
import Workspaces from "./Workspaces"

const time = Variable("").poll(1000, "date '+%H%n%M'")

function Divider() {
  return (<box className="divider" />)
}

function StartSection() {
  return (
    <box
      className="start"
      valign={Gtk.Align.START}
      halign={Gtk.Align.CENTER}
      spacing={4}
      vertical={true}>
      <Workspaces />

    </box >
  )
}
function CenterSection() {
  return <box className="center" />
}
function EndSection() {
  return <box className="end" />
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, BOTTOM, RIGHT } = Astal.WindowAnchor

  return <window
    className="Bar"
    gdkmonitor={gdkmonitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    layer={Astal.Layer.TOP}
    anchor={TOP | RIGHT | BOTTOM}
    application={App}>

    <box className="bar">
      <centerbox
        className="sections"
        vertical={true}>

        <StartSection />
        <CenterSection />
        <EndSection />
      </centerbox>
    </box>
  </window>
}
