{
  config,
  lib,
  pkgs,
  ...
}: let
  opts = config.opts;
  tomlFormat = pkgs.formats.toml {};
in {
  config = lib.mkIf opts.hyprland.waycorner.enable {
    home.packages = with pkgs; [waycorner];
    xdg.configFile."waycorner/config.toml" = {
      source = let
        corner = name: {
          onEnter,
          onExit,
          size,
          timeout,
          enable,
        }:
          if enable
          then {
            ${name} = {
              enter_command = onEnter;
              exit_command = onExit;
              inherit size timeout;
            };
          }
          else {};
        configFile =
          tomlFormat.generate "config.toml"
          (
            corner "bottomLeft" opts.hyprland.waycorner.bottomLeft
            // corner "bottomRight" opts.hyprland.waycorner.bottomRight
            // corner "topLeft" opts.hyprland.waycorner.topLeft
            // corner "topRight" opts.hyprland.waycorner.topRight
          );
      in
        pkgs.runCommand "waycorner-config.toml" {} ''
          cat ${configFile} >> $out
        '';
    };
  };
}
