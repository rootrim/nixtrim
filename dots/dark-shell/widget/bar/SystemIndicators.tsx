import { Variable, bind } from "astal"
import { GLib } from "astal"
import { Gtk } from "astal/gtk3"
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
        usePopover={true}
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
    valign={Gtk.Align.END}
    halign={Gtk.Align.CENTER}
    vertical={true}>
    <icon icon={bind(speaker, "volumeIcon")} />
    <label label={bind(speaker, "volume").as(v => `${Math.floor(v * 100)}`)} />
    <slider
      vertical={true}
      inverted={true}
      vexpand
      onDragged={({ value }) => speaker.volume = value}
      value={bind(speaker, "volume")}
    />
  </box>
}

export function BatteryLevel() {
  const bat = Battery.get_default()

  return <box className="Battery"
    visible={bind(bat, "isPresent")}
    vertical={true}
    valign={Gtk.Align.END}
    halign={Gtk.Align.CENTER}>
    <icon icon={bind(bat, "batteryIconName")} />
    <label label={bind(bat, "percentage").as(p =>
      `${Math.floor(p * 100)}`
    )} />
  </box>
}


export function TimeStatus() {

  const bat = Battery.get_default()
  const time = (time: number, format = "+%H%n%M") => GLib.DateTime
    .new_from_unix_local(time)
    .format(format)!
  return (
    <button
      className="Time"
      valign={Gtk.Align.END}
      halign={Gtk.Align.CENTER}
      onClicked={() => print(bat.batteryIconName)}>
      <label label={time()} />
    </button>
  )
}


export function Wifi() {
  const network = Network.get_default()
  const wifi = bind(network, "wifi")

  return <box
    visible={wifi.as(Boolean)}
    vertical={true}
    valign={Gtk.Align.END}
    halign={Gtk.Align.CENTER}>
    {wifi.as(wifi => wifi && (
      <icon
        tooltipText={bind(wifi, "ssid").as(String)}
        className="Wifi"
        icon={bind(wifi, "iconName")}
      />
    ))}
  </box>
}

export function RamUsage() {
  const ram = Variable("").poll(1000, `bash -c "free | awk '/Mem:/ {printf \\"%d\\", $3/$2 * 100}'"`)
  return (
    <box
      className="RamUsage"
      valign={Gtk.Align.END}
      halign={Gtk.Align.CENTER}
      vertical={true}>
      <icon icon="memory" />
      <label label={ram()} />
    </box>
  )
}

export function CpuUsage() {
  const cpu = Variable("").poll(1000, `bash -c "top -bn1 | grep 'Cpu(s)' | awk '{print int($2 + $4)}'"`)
  return (
    <box
      className="CpuUsage"
      valign={Gtk.Align.END}
      halign={Gtk.Align.CENTER}
      vertical={true}>
      <icon icon="ayatana-indicator-keyboard-Am" />
      <label label={cpu()} />
    </box>
  )
}
