{ pkgs, config, lib, ... }:
let opts = config.opts;
in {
  imports = [
    ./hyprland
    ./neovim
    ./cli
    ./firefox
    ./kitty
    ./fish
    ./widgets.nix
		./swww.nix
  ];

	config = {
		home.packages = with pkgs;
			(lib.optionals opts.vesktop.enable [ vesktop ])
			++ (lib.optionals opts.obsidian.enable [ obsidian ]);
	};
}
