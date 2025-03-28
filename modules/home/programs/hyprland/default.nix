{ lib, config, inputs, pkgs, ... }:
let opts = config.opts;
in {
  imports = [
    ./keybinds.nix
    ./monitors.nix
    ./autostart.nix
    ./env.nix
    #./appearance.nix
    #./input.nix
    #./window-rules.nix
    #./plugins.nix
  ];

  config = lib.mkIf opts.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      package =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };
}
