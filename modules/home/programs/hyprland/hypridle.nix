{
  lib,
  config,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf (opts.hyprland.hypridle.enable && opts.hyprland.enable) {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = opts.hyprland.hypridle.dimAfter;
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = opts.hyprland.hypridle.sleepDisplaysAfter;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = opts.hyprland.hypridle.suspendAfter;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
