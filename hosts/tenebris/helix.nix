{
  enable = true;
  settings = {
    theme = "catppuccin_transparent";

    editor = {
      line-number = "relative";
      cursor-shape.insert = "bar";
      color-modes = true;
      bufferline = "always";
    };
  };
  themes = {
    catppuccin_transparent = {
      inherits = "catppuccin_mocha";

      "ui.background".fg = "overlay0";
      "ui.popup".fg = "overlay2";
      "ui.window".fg = "surface1";
      "ui.menu".fg = "overlay2";
      "ui.menu.selected".bg = "surface1";
      "ui.menu.selected".fg = "surface1";
      "ui.help".fg = "overlay2";

      palette.overlay2 = "#9399b2";
      palette.surface1 = "#45475a";
    };
  };
}
