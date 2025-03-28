{ config, lib, ... }:
let opts = config.opts;
in {
  config = lib.mkIf opts.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      env = [
        "XCURSOR_SIZE,${builtins.toString opts.hyprland.cursorSize}"
        "HYPRCURSOR_SIZE,${builtins.toString opts.hyprland.cursorSize}"
        "HYPRCURSOR_THEME,Adwaita"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ] ++ (opts.hyprland.enviornmentVariables |> builtins.mapAttrs (name: value: "${name},${value}") |> builtins.attrValues);
    };
  };
}
