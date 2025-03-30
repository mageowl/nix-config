{ lib, ... }: {
	options.opts.fish = {
		functions = lib.mkOption {
			description = "Extra functions to add to the Fish shell.";
			default = { };
			type = lib.types.attrsOf lib.types.str;
		};
	};
}
