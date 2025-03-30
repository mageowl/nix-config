{
  enable = true;
  settings = {
    theme = "catppuccin_transparent";

    editor = {
      line-number = "relative";
      cursor-shape.insert = "bar";
      color-modes = true;
      bufferline = "always";

      end-of-line-diagnostics = "hint";
      inline-diagnostics = {
        cursor-line = "hint";
      };

      indent-guides.render = true;
    };
    keys.insert = {
      C-h = "move_char_left";
      C-j = "move_visual_line_down";
      C-k = "move_visual_line_up";
      C-l = "move_char_right";
    };
  };
  themes = {
    catppuccin_transparent = {
      inherits = "catppuccin_mocha";

      "ui.background".fg = "overlay0";
      "ui.popup".fg = "overlay2";
      "ui.window".fg = "surface1";
      "ui.menu".fg = "overlay2";
      "ui.menu.selected" = {
        bg = "surface1";
        fg = "text";
        bold = true;
      };
      "ui.help".fg = "overlay2";
      "ui.statusline".fg = "subtext1";
      "ui.statusline.inactive".fg = "subtext1";
      "ui.bufferline".fg = "subtext1";

      "variable.other.member" = "lavender";

      palette = {
        text = "#cdd6f4";
        subtext1 = "#b4befe";
        overlay2 = "#9399b2";
        surface1 = "#45475a";
        lavender = "#b4befe";
      };
    };
  };
  languages = [
    {
      name = "nix";
      formatter = {
        command = "alejandra";
        args = [
          "-q"
          "-"
        ];
      };
      auto-format = true;
    }
  ];
}
