{ config, lib, ... }:
let opts = config.opts;
in { config = lib.mkIf opts.cli.nh.enable { programs.nh.enable = true; }; }
