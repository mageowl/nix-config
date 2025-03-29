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

				gaps_in = opts.theme.padding.medium / 2;
				gaps_out = if opts.widgets.enable
					then with opts.theme.padding;
						"${builtins.toString big} ${builtins.toString big} ${builtins.toString small} ${builtins.toString big}"
					else opts.theme.padding.big;

				layout = opts.hyprland.layout;
			};
			decoration = {
				rounding = opts.theme.rounding.big;

				blur = {
					enabled = opts.hyprland.blur.enable;
					inherit (opts.hyprland.blur) passes size xray noise vibrancy;
				};

				shadow = {
					enabled = opts.hyprland.windowShadow.enable;
					inherit (opts.hyprland.windowShadow)
						range render_power sharp ignore_window scale;
					offset = "${builtins.toString opts.hyprland.windowShadow.offset.x} ${builtins.toString opts.hyprland.windowShadow.offset.x}";
					color = "rgb(${opts.hyprland.windowShadow.color.hex})";
					color_inactive = "rgb(${opts.hyprland.windowShadow.color_inactive.hex})";
				};
			};
		};
	};
}
