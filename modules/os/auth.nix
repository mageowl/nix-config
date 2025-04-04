{
  config,
  lib,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.hyprland.hyprlock.fingerprint {
    services.fprintd.enable = true;
  };
}
