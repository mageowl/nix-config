{ ... }@inputs: rec {
  types = import ./types.nix inputs;

  hyprland = import ./hyprland.nix;
	inherit (hyprland) mkMonitor mkAnimation;

  framework = import ./framework.nix inputs;
  inherit (framework) mkHome mkSystem;

	color = import ./color.nix inputs;
	inherit (color) hex rgb;
}
