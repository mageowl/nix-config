{ lib, ... }:
let
  mkFontOption = { default, example, kind }:
		{
			family = lib.mkOption {
				description = "Default ${kind} font.";
				inherit default example;
				type = lib.types.str;
			};
			features = lib.mkOption {
				description = "Font features for ${kind} font.";
				default = [ ];
				example = lib.literalExpression ''
					[ "ss01" "ss02" ]
				'';
				type = lib.types.listOf lib.types.str;
			};
		};
in {
  options.opts.theme.fonts = {
    monospace = mkFontOption {
      kind = "monospace";
      default = "Roboto Mono";
      example = "JetBrains Mono";
    };
    sansSerif = mkFontOption {
      kind = "sans serif";
      default = "Noto Sans";
      example = "Space Grotesk";
    };
    serif = mkFontOption {
      kind = "serif";
      default = "Noto Serif";
      example = "Roboto Serif";
    };
    emoji = mkFontOption {
      kind = "emoji";
      default = "Noto Color Emoji";
      example = "Noto Emoji";
    };
		size = {
			terminal = lib.mkOption {
				description = "Font size for terminal.";
				default = 11;
				example = 14;
				type = lib.types.int;
			};
			browser = lib.mkOption {
				description = "Font size for Firefox.";
				default = 14;
				example = 14;
				type = lib.types.int;
			};
		};
		kerning = lib.mkOption {
			description = "Modifies font kerning.";
			default = 0;
			example = 3;
			type = lib.types.int;
		};
  };
}
