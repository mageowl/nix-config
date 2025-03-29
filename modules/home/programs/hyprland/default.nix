{ lib, config, inputs, pkgs, ... }:
let opts = config.opts;
in {
  imports = [
    ./keybinds.nix
    ./monitors.nix
    ./autostart.nix
    ./env.nix
    ./appearance.nix
		./animation.nix
    ./input.nix
    ./window-rules.nix
    ./plugins.nix
  ];

  config = lib.mkIf opts.hyprland.enable {
		home = {
			packages = with pkgs; [ hyprpicker ];
			sessionVariables.NIXOS_OZONE_WL = "1";
		};

    wayland.windowManager.hyprland = {
      enable = true;
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

			settings = {
				dwindle.preserve_split = true;
				misc.disable_hyprland_logo = true;
			};
    };
  };
}
