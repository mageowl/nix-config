{ lib, pkgs, ... }:
let toml = pkgs.formats.toml { };
in {
	options.opts.helix = {
		enable = lib.mkEnableOption "Helix Editor";
		settings = lib.mkOption {
			description = "Configuration for Helix Editor. See https://docs.helix-editor.com/editor.html.";
			type = toml.type;
		};
		themes = lib.mkOption {
			description = "Custom themes for Helix Editor. See https://docs.helix-editor.com/themes.html.";
			type = toml.type;
		};
		languages = lib.mkOption {
			description = "Custom language settings for Helix Editor. See https://docs.helix-editor.com/languages.html.";
			type = lib.types.listOf toml.type;
		};
	};
}
