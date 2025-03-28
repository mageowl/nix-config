{ lib, ... }: {
	imports = [ ./colors.nix ./fonts.nix ];

	options.theme = {
		rounding = {
			big = lib.mkOption {
				description = "Large corner radius, for things like windows and widgets.";
				example = 10;
				default = 0;
			};
			small = lib.mkOption {
				description = "Small corner radius, for things inside windows and widgets.";
				example = 6;
				default = 0;
			};
		};
	};
}
