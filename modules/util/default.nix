{ ... }@inputs: rec {
  hyprland = import ./hyprland.nix;
  types = import ./types.nix inputs;

  framework = import ./framework.nix inputs;
  inherit (framework) mkHome mkSystem;

	color = import ./color.nix inputs;
	inherit (color) hex rgb;
}
