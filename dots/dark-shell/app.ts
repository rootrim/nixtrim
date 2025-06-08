import { App } from "astal/gtk3";
import style from "./style.scss";
import Bar from "./widget/Bar";
import { CornerBottomright, CornerTopright } from "./widget/ScreenCorners";

App.start({
  css: style,
  main() {
    App.get_monitors().map((monitor) => {
      Bar(monitor);
      CornerTopright(monitor);
      CornerBottomright(monitor);
    });
  },
});
