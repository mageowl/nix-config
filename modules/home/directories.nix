{ config, lib, ... }:
let opts = config.opts;
in {
	config = lib.mkIf opts.directories.enable {
		home.file = opts.directories.extra ++ (lib.optionals (opts.directories.temp != null) [ "temp" ])
			|> builtins.map (name: {
					name = "${name}/.keep";
					value = {
						text = "force nix to create directory.";
					};
				})
			|> builtins.listToAttrs;
		xdg.userDirs = 
		let
			mkDir = prop: name:
				{ ${name} = if prop != null then "${config.home.homeDirectory}/${prop}" else null; };
		in lib.mkMerge [
				{
					enable = true;
					createDirectories = true;
				}
				(mkDir opts.directories.desktop "desktop")
				(mkDir opts.directories.downloads "download")
				(mkDir opts.directories.documents "documents")
				(mkDir opts.directories.music "music")
				(mkDir opts.directories.videos "videos")
				(mkDir opts.directories.pictures "pictures")
				(mkDir opts.directories.templates "templates")
				(mkDir opts.directories.public "publicShare")
			];
	};
}
