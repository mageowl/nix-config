{ config, lib, ... }:
let opts = config.opts;
in {
  config = lib.mkIf opts.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      exec-once = [ ]
        ++ (lib.optionals opts.hyprland.hypridle.enable [ "hypridle" ])
        ++ (lib.optionals opts.swww.enable [ "swww-daemon" ])
        ++ (lib.optionals (opts.swww.enable && opts.swww.cycleEvery != null) [ "systemd start --user cycle_wallpaper" ])
        ++ (lib.optionals opts.widgets.enable [ "ags run" ])
        ++ opts.hyprland.autostart;
    };
  };
}
