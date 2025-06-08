import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"
import Mpris from "gi://AstalMpris"
import Battery from "gi://AstalBattery"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"
import Tray from "gi://AstalTray"



export function SysTray() {
  const tray = Tray.get_default()

  return <box
    className="SysTray"
    valign={Gtk.Align.END}
    halign={Gtk.Align.CENTER}
    vertical={true}>
    {bind(tray, "items").as(items => items.map(item => (
      <menubutton
        tooltipMarkup={bind(item, "tooltipMarkup")}
        usePopover={false}
        actionGroup={bind(item, "actionGroup").as(ag => ["dbusmenu", ag])}
        menuModel={bind(item, "menuModel")}>
        <icon gicon={bind(item, "gicon")} />
      </menubutton>
    )))}
  </box>
}

export function AudioSlider() {
  const speaker = Wp.get_default()?.audio.defaultSpeaker!

  return <box
    className="AudioSlider"
    css="min-height: 100px"
    valign={Gtk.Align.END}
    halign={Gtk.Align.CENTER}
    vertical={true}>
    <icon icon={bind(speaker, "volumeIcon")} />
    <slider
      vertical={true}
      vexpand
      onDragged={({ value }) => speaker.volume = value}
      value={bind(speaker, "volume")}
    />
  </box>
}

export function BatteryLevel() {
  const bat = Battery.get_default()

  return (
    <box
      className="Battery"
      visible={bind(bat, "isPresent")}
      valign={Gtk.Align.END}
      halign={Gtk.Align.CENTER}
      vertical={true}>
      <icon icon={bind(bat, "batteryIconName")} />
      <label label={bind(bat, "percentage").as(p =>
        `${Math.floor(p * 100)} %`
      )} />
    </box>
  )
}


export function TimeStatus() {

  const time = Variable("").poll(1000, "date '+%H%n%M'")
  return (
    <button
      className="Time"
      valign={Gtk.Align.END}
      halign={Gtk.Align.CENTER}
      onClicked={() => print("hello")}>
      <label label={time()} />
    </button>
  )
}
