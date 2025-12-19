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
      # Basic commandline utils
      ripgrep
      killall
      libnotify # notify-send
      bat
      sad
      fzf
      fd
      glib # launch applications with gio
      ffmpeg

      # Development utilities
      live-server
      gh
      codeberg-cli
      mdbook
      deno
      lua
      hyperfine

      # Hardware control
      brightnessctl
      playerctl
      speedtest-rs

      # Cli applications
      libqalculate
      btop
      tokei
      cava
      dust
      porsmo
    ];
  };
}
