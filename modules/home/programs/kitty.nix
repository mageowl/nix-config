{ config, lib, pkgs, ... }:
let cfg = config.opts;
in {
  config = lib.mkIf cfg.kitty.enable { programs.kitty = { enable = true; }; };
}
