from fabric.widgets.box import Box
from widgets.circular_indicator import CircularIndicator

# import gi
# gi.require_version("Gtk", "3.0")
# from gi.repository import Gtk

import psutil

from fabric.utils import invoke_repeater


class BatterySingle(Box):
    def __init__(self, size=24, **kwargs) -> None:
        super().__init__(orientation="h", **kwargs)

        self.battery_progress_bar = CircularIndicator(
            size=size,
            name="battery",
            icon="󰁹",
        )

        self.add(self.battery_progress_bar)

        invoke_repeater(1000, self.update_status)

    def update_status(self) -> bool:
        if not (bat_sen := psutil.sensors_battery()):
            self.battery_progress_bar.progress_bar.value = 0.42
            self.battery_progress_bar.label.set_label("INF%")
        else:
            if psutil.sensors_battery().power_plugged:
                self.battery_progress_bar.icon.set_label("")
            else:
                self.battery_progress_bar.icon.set_label(self.give_label(bat_sen))
            self.battery_progress_bar.progress_bar.value = bat_sen.percent / 100
            self.battery_progress_bar.label.set_label(str(int(bat_sen.percent)) + "%")

        return True

    def give_label(self, bat_sen) -> str:
        bat_sen = bat_sen.percent
        if bat_sen >= 100:
            return "󰁹"
        elif bat_sen >= 90:
            return "󰂂"
        elif bat_sen >= 80:
            return "󰂁"
        elif bat_sen >= 70:
            return "󰂀"
        elif bat_sen >= 60:
            return "󰁿"
        elif bat_sen >= 50:
            return "󰁾"
        elif bat_sen >= 40:
            return "󰁽"
        elif bat_sen >= 30:
            return "󰁼"
        elif bat_sen >= 20:
            return "󰁻"
        elif bat_sen >= 10:
            return "󰁺"
        else:
            return "Deez Nuts"  # Sorry if am rude
