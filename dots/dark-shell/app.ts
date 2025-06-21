import { App } from "astal/gtk3";
import style from "./style.scss";
import NotificationPopups from "./widget/notification/NotificationPopups";
import Bar from "./widget/bar/Bar";
import {
  CornerBottomright,
  CornerTopright,
} from "./widget/utilites/ScreenCorners";

App.start({
  css: style,
  main() {
    App.get_monitors().map((monitor) => {
      Bar(monitor);
      NotificationPopups(monitor);
      CornerTopright(monitor);
      CornerBottomright(monitor);
    });
  },
});
