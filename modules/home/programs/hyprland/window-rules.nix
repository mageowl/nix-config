{ config, lib, ... }:
let opts = config.opts;
in {
	config = lib.mkIf opts.hyprland.enable {
		wayland.windowManager.hyprland.settings = {
			windowrulev2 = [
				"suppressevent maximize, class:.*"
				"center, floating:1"
				"nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
				"tile, class:Aseprite"
			] # Obsidian transparency
				++ (lib.optionals (opts.obsidian.opacity < 1) [ "opacity ${opts.obsidian.opacity}, class:Obsidian" ]);
			layerrule = (lib.optionals opts.widgets.enable [
				"blur, gtk-layer-shell"
				"ignorealpha 0.3, gtk-layer-shell"
				"blur, launcher-menu"
				"ignorealpha 0.5, launcher-menu"
				"animation slide top, launcher-menu"
			]);
		};
	};
}
