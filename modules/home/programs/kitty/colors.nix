opts: with opts.theme.col; {
	color1 = red;
	color9 = red;
	color2 = green;
	color10 = green;
	color3 = yellow;
	color11 = yellow;
	color4 = blue;
	color12 = blue;
	color5 = magenta;
	color13 = magenta;
	color6 = cyan;
	color14 = cyan;
} |> builtins.mapAttrs (_: {hex, ...}: "#" + hex)
