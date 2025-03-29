{ config, lib, pkgs, inputs, const, ... }:
let opts = config.opts;
in {
	config = lib.mkIf opts.hyprland.enable {
		wayland.windowManager.hyprland = {
			plugins = with pkgs; (
				lib.optionals opts.hyprland.plugin.dynamicCursors.enable [
					inputs.hypr-dynamic-cursors.packages.${const.system}.hypr-dynamic-cursors
				]
			);
			settings = {
				plugin.dynamic-cursors = lib.mkIf opts.hyprland.plugin.dynamicCursors.enable {
					threshold = opts.hyprland.plugin.dynamicCursors.threshold;
					shake.enabled = opts.hyprland.plugin.dynamicCursors.enableShakeToFind;
				};
			};
		};
	};
}
