{ config, lib, ... }:
let opts = config.opts;
in {
	config = lib.mkIf opts.hyprland.enable {
		wayland.windowManager.hyprland.settings = {
			animations = {
				enabled = opts.hyprland.animation.enable;
				bezier = [ "custom, 0.05, 0.9, 0.1, 1.05" ];

				animation = opts.hyprland.animation 
					|> builtins.mapAttrs (name: { enable, duration, curve, style }:
						if name == "enable"
							then { enable = false; }
							else {
								inherit enable;
								value = if builtins.isNull style
									then "${name}, 1, ${duration}, ${curve}"
									else "${name}, 1, ${duration}, ${curve}, ${style}";
							})
					|> builtins.attrValues
					|> builtins.filter ({enable, ...}: enable)
					|> builtins.map ({value, ...}: value);
			};
		};
	};
}
