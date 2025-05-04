{
  lib,
  config,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.joycond.enable {
    services.joycond.enable = true;
  };
}
