{ pkgs, config, lib, ... }:
let opts = config.opts;
in {
  imports = [
    ./hyprland
    ./helix
    ./cli
    ./firefox
    ./kitty
    ./fish
    ./widgets.nix
		./swww.nix
		./prismLauncher.nix
  ];

	config = {
		home.packages = with pkgs;
			(lib.optionals opts.vesktop.enable [ vesktop ])
			++ (lib.optionals opts.obsidian.enable [ obsidian ]);
	};
}
