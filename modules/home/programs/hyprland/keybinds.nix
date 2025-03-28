{ config, lib, const, ... }:
let
  opts = config.opts;
  forWorkspaces = fn:
    builtins.genList (i:
      let
        id = builtins.toString (i + 1);
        # zero should be used as the key to switch to workspace 10
        key = if id == "10" then "0" else id;
      in fn id key) 10;
  vk = key: dir: { inherit key dir; };
  forVimKeys = fn:
    (builtins.map ({ key, dir }: fn key dir) [
      (vk "h" "l")
      (vk "j" "d")
      (vk "k" "u")
      (vk "l" "r")
    ]);
in {
  wayland.windowManager.hyprland.settings = lib.mkIf opts.hyprland.enable {
    "$mod" = opts.hyprland.modifier;
    "$term" = opts.hyprland.terminal;
    bind = [
      # Exit hyprland
      "$mod SHIFT, Escape, exit"

      # Modify window
      "$mod, Q, killactive"
      "$mod SHIFT, Q, killactive"
      "$mod, T, togglefloating"
      "$mod, F, fullscreen, 0"
      "$mod, C, centerwindow"
      "$mod, N, togglesplit"

      # Multimedia keys
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ] # Switch workspaces
      ++ forWorkspaces (id: key: "$mod, ${key}, workspace, ${id}")
      # Move window to workspace
      ++ forWorkspaces (id: key: "$mod SHIFT, ${key}, movetoworkspace, ${id}")
      # Navigation
      ++ forVimKeys (key: dir: "$mod, ${key}, movefocus, ${dir}") ++ forVimKeys
      (key: dir: "$mod SHIFT, ${key}, movewindow, ${dir}")
      # Move workspaces
      ++ forVimKeys
      (key: dir: "$mod ALT, ${key}, movecurrentworkspacetomonitor, ${dir}")
      # Launch terminal
      ++ (lib.optionals (opts.hyprland.terminal != "") [
        "$mod, Return, exec, $term"
        "$mod SHIFT, Return, exec, [float] $term"
      ])
      # Prompts & launchers
      ++ (lib.optionals opts.widgets.enable [
        "$mod, Space, exec, astal menu drun"
        "$mod, SemiColon, exec, astal menu commandPrompt"
        "$mod, Equal, exec, astal menu calculator"
        "$mod SHIFT, Space, exec, astal menu quickAction"
      ])
      # Screenshot
      ++ (lib.optionals opts.cli.grim.enable [
        ''$mod, G, exec, grim -g "$(slurp)" "/home/${const.username}/screenshots/$(date +'screenshot_%Y-%m-%d_%H:%M:%S')"''
        ''$mod SHIFT, G, exec, grim -g "$(slurp)" - | wl-copy''
      ])
      # Playerctl keybinds
      ++ (lib.optionals opts.cli.playerctl.enable [
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl prev"
      ])
      # User-defined keybinds
      ++ opts.hyprland.additionalKeybinds;

    # Move windows with mouse + mod
    bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
  };
}
