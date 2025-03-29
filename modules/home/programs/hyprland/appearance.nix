{ config, lib, ... }:
let
	opts = config.opts;
	alpha = a: lib.toHexString (builtins.floor (a * 255));
in {
	config = lib.mkIf opts.hyprland.enable {
		wayland.windowManager.hyprland.settings = {
			general = {
				"col.active_border" = "rgba(${opts.theme.col.accent1.hex}${alpha opts.theme.borders.opacity.active})";
				"col.inactive_border" = "rgba(${opts.theme.col.foreground.hex}${alpha opts.theme.borders.opacity.inactive})";
				border_size = opts.theme.borders.width;

				gaps_in = opts.theme.padding.small;
				gaps_out = opts.theme.padding.big;

				layout = opts.hyprland.layout;
			};
			decoration = {
				rounding = opts.theme.rounding.big;

				blur = {
					enabled = opts.hyprland.blur.enable;
					inherit (opts.hyprland.blur) passes size xray noise vibrancy;
				};
			};
		};
	};
}
