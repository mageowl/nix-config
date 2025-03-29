{ config, lib, pkgs, ... }:
let opts = config.opts;
in {
  config = lib.mkIf opts.cli.misc.enable {
    home.packages = with pkgs; [ ripgrep gh killall brightnessctl libqalculate ];
  };
}
