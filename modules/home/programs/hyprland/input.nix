{ lib, config, ... }:
let opts = config.opts;
in {
	config = lib.mkIf opts {
		wayland.windowManager.hyprland.settings = {
			input = {
				kb_layout = "us";
			};

			follow_mouse = 1;
			sensitivity = opts.hyprland.mouseSensitivity;

			touchpad = {
				clickfinger_behavior = true;
				disable_while_typing = false;
				natural_scroll = opts.hyprland.naturalScroll;
			};
		};
	};
}
