{ lib, ... }: {
	imports = [ ./colors.nix ./fonts.nix ];

	options.opts.theme = {
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
		padding = {
			big = lib.mkOption {
				example = 14;
				default = 0;
			};
			medium = lib.mkOption {
				example = 14;
				default = 0;
			};
			small = lib.mkOption {
				example = 5;
				default = 0;
			};
		};
		borders.width = lib.mkOption {
			description = "Border width for windows and widgets.";
			example = 2;
			default = 1;
		};
	};
}
