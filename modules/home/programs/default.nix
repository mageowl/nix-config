{config, ...}: let
  opts = config.opts;
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
    ./blender.nix
    ./dungeondraft.nix
    ./prismLauncher.nix
  ];

  config = {
    home.packages = opts.programs;
  };
}
