{ lib, ... }: {
  imports = [ ./hyprland.nix ./cli.nix ./widgets.nix ./neovim.nix ];

  options.opts = {
    kitty = {
			enable = lib.mkEnableOption "kitty terminal";

			lineSpacing = lib.mkOption {
				description = "Modifies cell height.";
				default = 0;
				example = 2;
				type = lib.types.int;
			};
		};

    _1password.enable = lib.mkEnableOption "1Password";
    firefox.enable = lib.mkEnableOption "Firefox";

    swww = {
			enable = lib.mkEnableOption "wallpapers";
			wallpaperDir = lib.mkOption {
				description = "Path to wallpapers.";
				example = lib.literalExpression "./wallpapers";
				type = lib.types.path;
			};
			cycleEvery = lib.mkOption {
				description = "The delay at which to change wallpapers.";
				example = lib.literalExpression "1h";
				type = lib.types.str;
			};
		};
  };
}
