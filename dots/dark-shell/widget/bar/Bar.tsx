import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import Workspaces from "./Workspaces"
import { AudioSlider, BatteryLevel, CpuUsage, RamUsage, SysTray, TimeStatus, Wifi } from "./SystemIndicators"

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
  return (
    <box
      className="end"
      valign={Gtk.Align.END}
      halign={Gtk.Align.CENTER}
      spacing={4}
      vertical={true}>
      <AudioSlider />
      <CpuUsage />
      <RamUsage />
      <Wifi />
      <BatteryLevel />
      <SysTray />
      <TimeStatus />
    </box>
  )
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
  const { TOP, BOTTOM, RIGHT } = Astal.WindowAnchor

  return (
    <window
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
  )
}
