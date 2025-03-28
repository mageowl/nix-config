{ config, lib, pkgs, ... }:
let opts = config.opts;
in {
  config =
    lib.mkIf opts.cli.playerctl.enable { services.playerctld.enable = true; };
}
