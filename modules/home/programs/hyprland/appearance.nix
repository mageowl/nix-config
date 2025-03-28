{ config, lib, ... }:
let opts = config.opts;
in {
	config = lib.mkIf opts.hyprland.enable {
		wayland.windowManager.hyprland.settings = {
			general = {
			};
			decoration = {
				rounding = opts.theme.rounding.big;
			};
		};
	};
}
