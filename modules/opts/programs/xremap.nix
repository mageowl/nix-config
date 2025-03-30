{ lib, pkgs, ... }:
{
  options.opts.xremap = {
    enable = lib.mkEnableOption "key remapping";
    config = lib.mkOption {
      description = "XRemap configuration";
      type = (pkgs.formats.yaml { }).type;
    };
  };
}
