opts:
with opts.theme.col;
  {
    color1 = red;
    color9 = brightRed;
    color2 = green;
    color10 = brightGreen;
    color3 = yellow;
    color11 = brightYellow;
    color4 = blue;
    color12 = brightBlue;
    color5 = magenta;
    color13 = brightMagenta;
    color6 = cyan;
    color14 = brightCyan;

    url_color = blue;
  }
  |> builtins.mapAttrs (_: {hex, ...}: "#" + hex)
