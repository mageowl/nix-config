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

    swww = { enable = lib.mkEnableOption "wallpapers"; };
  };
}
