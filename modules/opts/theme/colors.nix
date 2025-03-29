{ lib, util, ... }: {
	options.opts.theme = {
		col = let
			mkColorOption = default: lib.mkOption {
				default = util.hex default;
				type = util.types.color;
			};
			in {
			background = lib.mkOption {
				description = "Background color for applications.";
				example = lib.literalExpression ''util.hex "000"'';
				default = util.hex "000";
				type = util.types.color;
			};
			foreground = lib.mkOption {
				description = "Default text color for applications.";
				example = lib.literalExpression ''util.hex "fff"'';
				default = util.hex "fff";
				type = util.types.color;
			};
			foregroundDim = lib.mkOption {
				description = "Dim text color for applications.";
				example = lib.literalExpression ''util.hex "ccc"'';
				default = util.hex "ccc";
				type = util.types.color;
			};

			accent1 = lib.mkOption {
				description = "Accent color for applications.";
				example = lib.literalExpression ''util.hex "00f"'';
				default = util.hex "fff";
				type = util.types.color;
			};
			accent2 = lib.mkOption {
				description = "Secondary accent color for applications.";
				example = lib.literalExpression ''util.hex "08f"'';
				default = util.hex "fff";
				type = util.types.color;
			};

			red = mkColorOption "f38ba8";
			orange = mkColorOption "eba0ac";
			yellow = mkColorOption "f9e2af";
			green = mkColorOption "a6e3a1";
			cyan = mkColorOption "94e2d5";
			blue = mkColorOption "89b4fa";
			magenta = mkColorOption "cba6f7";
			pink = mkColorOption "f5c2e7";
		};

		backgroundOpacity = lib.mkOption {
			description = "Background transparency of some applications.";
			example = 0.6;
			default = 1.0;
			type = lib.types.float;
		};
		borders.opacity = {
			inactive = lib.mkOption {
				description = "Border transparency of windows and widgets.";
				example = 0.6;
				default = 1.0;
				type = lib.types.float;
			};
			active = lib.mkOption {
				description = "Border transparency of focused windows.";
				example = 0.2;
				default = 1.0;
				type = lib.types.float;
			};
		};
	};
}
