{ config, lib, pkgs, ... }:
let opts = config.opts;
in {
  config = lib.mkIf opts.kitty.enable {
		programs.kitty = {
			enable = true;
			settings = let 
				features = opts.theme.fonts.features |> builtins.map (f: "+${f}") |> builtins.concatStringsSep " ";
			in {
				# Fonts
				font_family = ''family="${opts.theme.fonts.monospace}" style="Light" features="${features}"'';
				bold_font = ''family="${opts.theme.fonts.monospace}" style="ExtraBold" features="${features}"'';
				bold_italic_font = ''family="${opts.theme.fonts.monospace}" style="ExtraBold Italic" features="${features}"'';
				italic_font = ''family="${opts.theme.fonts.monospace}" style="Italic" features="${features}"'';
				font_size = opts.theme.fonts.size.terminal;

				# Force Nerd Fonts symbols
				symbol_map = "U+e000-U+e00a,U+ea60-U+ebeb,U+e0a0-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b1,U+e700-U+e7c5,U+ed00-U+efc1,U+f000-U+f2ff,U+f000-U+f2e0,U+f300-U+f372,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono";

				# Background opacity
				background_opacity = opts.theme.backgroundOpacity;

				# Padding
				window_padding_width = opts.theme.padding.big;
			};

			# Cell size
			extraConfig = ''
				modify_font cell_width ${builtins.toString opts.theme.fonts.kerning}px
				modify_font cell_height ${builtins.toString opts.kitty.lineSpacing}px
			'';
		};
	};
}
