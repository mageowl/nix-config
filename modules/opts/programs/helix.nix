{ lib, pkgs, ... }:
let toml = pkgs.formats.toml { };
in {
	options.opts.helix = {
		enable = lib.mkEnableOption "Helix Editor";
		settings = lib.mkOption {
			description = "Configuration for the Helix Editor.";
			type = toml.type;
		};
		themes = lib.mkOption {
			description = "Custom themes for the Helix Editor.";
			type = toml.type;
		};
	};
}
