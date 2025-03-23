import fabric
from fabric import Application
from fabric.utils import get_relative_path
from fabric.widgets.datetime import DateTime
from fabric.widgets.box import Box
from fabric.widgets.centerbox import CenterBox
from fabric.widgets.wayland import WaylandWindow as Window
from fabric.hyprland.widgets import Workspaces, WorkspaceButton

from widgets.battery import BatterySingle


class StatusBar(Window):
    def __init__(self):
        super().__init__(
            name="bar",
            title="right-bar",
            layer="top",
            anchor="top right bottom right",
            # margin="-4px -4px -4px -4px",
            exclusivity="auto",
            size=70,
        )

        self.workspaces = Workspaces(
            name="workspaces",
            orientation="v",
            h_align="center",
            size=40,
            spacing=4,
            buttons_factory=lambda ws_id: (
                WorkspaceButton(
                    id=ws_id,
                    label=str(ws_id),
                )
                if ws_id >= 0
                else None
            ),
        )

        self.date_time = DateTime(
            formatters=("%H\n%M", "%H\n%M\n%S", "%d\n%m\n%y"),
            size=40,
            h_align="center",
            v_align="center",
        )

        self.battery = BatterySingle(name="battery", h_align="center", size=24)

        self.children = CenterBox(
            name="bar",
            orientation="v",
            start_children=Box(
                name="bar-inner",
                spacing=4,
                orientation="v",
                size=40,
                children=[self.workspaces],
            ),
            center_children=Box(
                name="bar-inner",
                spacing=4,
                orientation="v",
                size=40,
                children=[
                    self.date_time,
                ],
            ),
            end_children=Box(
                name="bar-inner",
                spacing=4,
                orientation="v",
                size=40,
                children=[
                    # self.system_tray,
                    self.battery,
                    # self.notification_button,
                ],
            ),
        )


if __name__ == "__main__":
    bar = StatusBar()
    app = Application("bar", bar)
    app.set_stylesheet_from_file(get_relative_path("./styles/style.css"))
    app.run()
