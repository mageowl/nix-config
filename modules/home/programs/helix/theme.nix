{
  config,
  lib,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.helix.enable {
    programs.helix.themes.nix = {
      attribute = "brightYellow";
      type = "brightYellow";
      "type.enum.variant" = "brightCyan";

      constructor = "brightCyan";

      constant = "yellow";
      "constant.character" = "cyan";
      "constant.character.escape" = "brightRed";

      string = "brightGreen";
      "string.regexp" = "brightRed";
      "string.special" = "blue";
      "string.special.symbol" = "red";

      comment = {
        fg = "white";
        modifiers = ["italic"];
      };

      variable = "foreground";
      "variable.parameter" = {
        fg = "red";
        modifiers = ["italic"];
      };
      "variable.builtin" = "red";
      "variable.other.member" = "brightBlue";

      label = "brightCyan"; # lifetimes

      punctuation = "white";
      "punctuation.special" = "brightCyan";

      keyword = "magenta";
      "keyword.control.conditional" = {
        fg = "magenta";
        modifiers = ["italic"];
      };

      operator = "cyan";

      function = "blue";
      "function.macro" = "cyan";

      tag = "red";

      namespace = {
        fg = "brightBlue";
        modifiers = ["italic"];
      };

      special = "blue"; # fuzzy highlight

      "markup.heading" = "red";
      "markup.list" = "cyan";
      "markup.list.unchecked" = "foregroundDim";
      "markup.list.checked" = "brightGreen";
      "markup.bold".modifiers = ["bold"];
      "markup.italic".modifiers = ["italic"];
      "markup.link" = "blue";
      "markup.link.url" = {
        fg = "blue";
        modifiers = ["italic"];
        "underline.style" = "line";
      };
      "markup.raw" = "brightBlue";
      "markup.quote" = "brightRed";

      "diff.plus" = "brightGreen";
      "diff.minus" = "red";
      "diff.delta" = "brightYellow";

      # User Interface

      "ui.background" = "white";
      "ui.background.seperator" = "bright";

      "ui.linenr" = "white";
      "ui.linenr.selected" = "brightBlue";

      "ui.statusline.inactive" = "white";
      "ui.statusline.normal" = {
        bg = "brightBlue";
        fg = "background";
        modifiers = ["bold"];
      };
      "ui.statusline.insert" = {
        bg = "green";
        fg = "background";
        modifiers = ["bold"];
      };
      "ui.statusline.select" = {
        bg = "brightRed";
        fg = "background";
        modifiers = ["bold"];
      };

      "ui.popup" = {
        fg = "foregroundDim";
        bg = "black";
      };
      "ui.window" = "white";
      "ui.help" = {
        fg = "foregroundDim";
        bg = "black";
      };

      "ui.text" = "foreground";
      "ui.text.focus" = {
        fg = "foreground";
        modifiers = ["bold"];
      };
      "ui.text.inactive" = "white";
      "ui.text.directory" = "blue";

      "ui.virtual" = "black";
      "ui.virtual.inlay-hint" = {
        fg = "white";
        bg = "black";
      };
      "ui.virtual.jump-label" = {
        fg = "brightMagenta";
        modifiers = ["bold"];
      };

      "ui.selection".bg = "brightBlack";

      "ui.cursor" = {
        fg = "background";
        bg = "blue";
      };
      "ui.cursor.match" = {
        fg = "brightRed";
        modifiers = ["bold"];
      };

      "ui.cursor.primary.normal" = {
        fg = "background";
        bg = "brightBlue";
      };
      "ui.cursor.primary.insert" = {
        fg = "background";
        bg = "brightGreen";
      };
      "ui.cursor.primary.select" = {
        fg = "background";
        bg = "brightRed";
      };

      "ui.cursor.normal" = {
        fg = "background";
        bg = "blue";
      };
      "ui.cursor.insert" = {
        fg = "background";
        bg = "green";
      };
      "ui.cursor.select" = {
        fg = "background";
        bg = "red";
      };

      "ui.highlight" = {
        bg = "black";
        modifiers = ["bold"];
      };

      "ui.menu" = "brightWhite";
      "ui.menu.selected" = {
        fg = "foreground";
        bg = "black";
        modifiers = ["bold"];
      };

      "diagnostic.error".underline = {
        style = "curl";
        color = "red";
      };
      "diagnostic.warning".underline = {
        style = "curl";
        color = "brightYellow";
      };
      "diagnostic.info".underline = {
        style = "curl";
        color = "brightBlue";
      };
      "diagnostic.hint".underline = {
        style = "curl";
        color = "cyan";
      };
      "diagnostic.unnecessary".modifiers = ["dim"];

      error = "red";
      warning = "brightYellow";
      info = "brightBlue";
      hint = "cyan";

      palette = opts.theme.col |> builtins.mapAttrs (_: v: "#" + v.hex);
    };
  };
}
