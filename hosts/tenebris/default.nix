{ util, ... }: {
  opts = {
    hyprland = {
      enable = true;

      monitors = [
        (util.hyprland.mkMonitor {
          name = "eDP-1";
          position = "2560x240";
          scale = 2;
        })
        (util.hyprland.mkMonitor {
          name = "DP-2";
          position = "0x0";
          scale = 1.5;
        })
      ];
    };

    widgets.enable = true;
    kitty.enable = true;
    cli.enableAll = true;
    nvim.enable = true;
    firefox.enable = true;
    _1password.enable = true;
  };
}
