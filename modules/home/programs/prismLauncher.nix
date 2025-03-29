{ config, lib, pkgs, ... }: 
let opts = config.opts;
in {
	config = lib.mkIf opts.prismLauncher.enable {
		home.packages = [ pkgs.prismlauncher ];
		/*home.file.".local/share/PrismLauncher/prismlauncher.cfg" = {
			enable = !(builtins.pathExists "${config.home.homeDirectory}/.local/share/PrismLauncher/prismlauncher.cfg");
			text = ''
				[General]
				DownloadsDir=${opts.directories.downloads}
				InstanceDir=${opts.prismLauncher.instancesDirectory}
			'';
		};*/
	};
}
