{ lib, util, ... }: {
	options.opts.theme = {
		col = {
			background = lib.mkOption {
				description = "Background color for applications.";
				example = lib.literalExpression ''util.hex "#000"'';
				default = util.hex "#000";
				type = util.types.color;
			};
			foreground = lib.mkOption {
				description = "Default text color for applications.";
				example = lib.literalExpression ''util.hex "#fff"'';
				default = util.hex "#fff";
				type = util.types.color;
			};
			accent1 = lib.mkOption {
				description = "Accent color for applications.";
				example = lib.literalExpression ''util.hex "#00f"'';
				default = util.hex "#fff";
				type = util.types.color;
			};
			accent2 = lib.mkOption {
				description = "Secondary accent color for applications.";
				example = lib.literalExpression ''util.hex "#08f"'';
				default = util.hex "#fff";
				type = util.types.color;
			};
		};

		backgroundOpacity = lib.mkOption {
			description = "Background transparency of some applications.";
			example = 0.6;
			default = 1.0;
			type = lib.types.float;
		};
	};
}
