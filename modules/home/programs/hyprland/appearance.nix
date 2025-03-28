{ config, lib, ... }:
let opts = config.opts;
in {
	config = lib.mkIf opts.hyprland.enable {
		wayland.windowManager.hyprland.settings = {
			general = {
				"col.active_border" = "rgba(${opts.theme.col.accent1.hex}${lib.toHexString (builtins.floor opts.theme.borderOpacity.active * 255)})";
				"col.inactive_border" = "rgba(${opts.theme.col.foreground.hex}${lib.toHexString (builtins.floor opts.theme.borderOpacity.inactive * 255)})";
				gaps_in = opts.theme.padding.small;
				gaps_out = opts.theme.padding.big;
			};
			decoration = {
				rounding = opts.theme.rounding.big;
			};
		};
	};
}
