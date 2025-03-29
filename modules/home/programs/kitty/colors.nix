opts: with opts.theme.col; {
	color1 = red;
	color2 = green;
	color3 = yellow;
	color4 = blue;
	color5 = magenta;
	color6 = cyan;
} |> builtins.mapAttrs (_: {hex, ...}: "#" + hex)
