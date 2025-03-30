{
  config,
  lib,
  inputs,
  const,
  ...
}:
let
  opts = config.opts;
in
{
  imports = [ inputs.xremap.nixosModules.default ];
  config = lib.mkIf opts.xremap.enable {
    services.xremap = {
      withHypr = true;
      userName = const.username;
      config = opts.xremap.config;
    };

    hardware.uinput.enable = true;
    users.groups.uinput.members = [ const.username ];
    users.groups.input.members = [ const.username ];
  };
}
