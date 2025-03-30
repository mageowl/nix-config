{
  config,
  lib,
  pkgs,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.swww.enable {
    services.swww.enable = true;
    home.file."${config.xdg.configHome}/wallpapers" = {
      source = opts.swww.wallpaperDir;
      recursive = false;
    };

    systemd.user = lib.mkIf (opts.swww.cycleEvery != null) {
      services.cycle_wallpaper = {
        Unit.Description = "refresh wallpaper at a set interval.";
        Service = {
          Type = "oneshot";
          ExecStart = builtins.toString (
            pkgs.writers.writeFish "cycle_wallpaper" (
              ''
                set img (random choice ${opts.swww.wallpaperDir}/*)
                swww img $img
              ''
              + (
                if opts.hyprland.hyprlock.enable
                then ''
                  echo \
                  "background
                  	path = $img
                  	blur_passes = 2
                  }" > /tmp/hyprlock-bg.conf
                ''
                else ""
              )
            )
          );
        };
        Install.WantedBy = ["default.target"];
      };
      timers.cycle_wallpaper = {
        Unit.Description = "refresh wallpaper at a set interval.";
        Timer = {
          Unit = "cycle_wallpaper.service";
          OnUnitActiveSec = opts.swww.cycleEvery;
        };
        Install.WantedBy = ["timers.target"];
      };
    };
  };
}
