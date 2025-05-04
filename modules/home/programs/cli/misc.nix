{
  config,
  lib,
  pkgs,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.cli.misc.enable {
    home.packages = with pkgs; [
      live-server
      ripgrep
      gh
      killall
      brightnessctl
      libqalculate
      playerctl
      bat
      btop
      libnotify
      tokei
      mdbook
      deno
      cava
    ];
  };
}
