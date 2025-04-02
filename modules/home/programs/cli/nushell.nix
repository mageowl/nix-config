{
  config,
  lib,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.cli.nushell.enable {
    programs.nushell.enable = true;
  };
}
