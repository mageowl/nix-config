{ ... }@inputs: rec {
  hyprland = import ./hyprland.nix;
  types = import ./types.nix inputs;

  configurations = import ./configurations.nix inputs;
  inherit (configurations) mkHome mkSystem;
}
