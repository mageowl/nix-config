{
  config,
  lib,
  ...
}: let
  opts = config.opts;
in {
  imports = [./nh.nix ./misc.nix ./nushell.nix ./grim.nix ./git.nix];

  config.opts.cli = lib.mkIf opts.cli.enableAll {
    nh.enable = true;
    grim.enable = true;
    misc.enable = true;
    git.enable = true;
    nushell.enable = true;
  };
}
