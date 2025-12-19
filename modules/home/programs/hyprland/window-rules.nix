{
  config,
  lib,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      windowrule =
        [
          "suppressevent maximize, class:.*"
          "center, floating:1"
          "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
          "tile, class:Aseprite"
          "size 930 1024, center, floating:1, class:org.godotengine.Engine"
        ] # Obsidian transparency
        ++ (lib.optionals (opts.obsidian.opacity < 1) ["opacity ${builtins.toString opts.obsidian.opacity}, class:obsidian"])
        ++ opts.hyprland.additionalWindowRules;
      layerrule = lib.optionals opts.widgets.enable [
        "blur, gtk-layer-shell"
        "ignorealpha 0.3, gtk-layer-shell"
        "blur, launcher-menu"
        "ignorealpha 0.5, launcher-menu"
        "animation slide top, launcher-menu"
      ];
    };
  };
}
