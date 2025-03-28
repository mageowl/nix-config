{ config, lib, ... }:
let opts = config.opts;
in {
	config = lib.mkIf opts.cli.git.enable {
		programs.git = {
			enable = true;
			userEmail = opts.cli.git.email;
			userName = opts.cli.git.name;
			extraConfig = {
				init.defaultBranch = opts.cli.git.defaultBranch;
				pull.rebase = false;
				core.editor = "nvim";
			};
		};
		programs.lazygit = lib.mkIf opts.cli.git.lazygit.enable {
			enable = true;
		};
	};
}
