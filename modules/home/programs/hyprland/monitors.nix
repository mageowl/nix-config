{ config, lib, util, ... }:
let opts = config.opts;
in {
  config = lib.mkIf opts.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      monitor = if (builtins.length opts.hyprland.monitors) == 0 then
        [ ",,," ]
      else
        builtins.map ({ name, resolution, position, scale, ... }:
          "${name}, ${resolution}, ${position}, ${builtins.toString scale}")
        opts.hyprland.monitors;
    };
  };
}
