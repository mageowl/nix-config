{ lib, ... }: {
  imports = [ ./programs ./theme ];

  options = {
    opts = {
      user.name = lib.mkOption {
        description = "Human-readable name for the main user.";
        default = "NixOS User";
        example = "NixOS User";
				type = lib.types.str;
      };

			directories =
				let mkDir = name: defaultOn: 
					lib.mkOption {
						description = "Name of ${name} directory";
						default = if defaultOn then name else null;
						example = name;
						type = lib.types.nullOr lib.types.str;
					};
				in {
					enable = lib.mkEnableOption "auto-created directories.";
					downloads = mkDir "downloads" true;
					documents = mkDir "documents" true;
					desktop = mkDir "desktop" true;
					music = mkDir "music" false;
					videos = mkDir "videos" false;
					pictures = mkDir "pictures" false;
					public = mkDir "public" false;
					templates = mkDir "templates" false;
					temp = mkDir "temp" false;

					extra = lib.mkOption {
						description = "Extra directories to create.";
						default = [ ];
						example = [ "dir-one" "dir-two" ];
						type = lib.types.listOf lib.types.str;
					};
				};
    };
  };
}
