{ lib, util, ... }: {
  options.opts.hyprland = {
    enable = lib.mkEnableOption "Hyprland";

    cursorSize = lib.mkOption {
      description = "Cursor size for Hyprland";
      default = 24;
      example = 24;
      type = lib.types.int;
    };

    monitors = lib.mkOption {
      description = "Monitor configuration for Hyprland.";
      default = [ ];
      example = lib.literalExpression ''
        				[
        					(util.hyprland.mkMonitor {
        						name = "DP-1";
        						resolution = "1920x1080@144";
        						position = "0x0";
        						scale = 1;
        					})
        				]
        			'';
      type = lib.types.listOf util.types.hyprlandMonitor;
    };

    modifier = lib.mkOption {
      default = "SUPER";
      example = "ALT";
      description = "Main modifier for all Hyprland shortcuts.";
      type = lib.types.str;
    };
    terminal = lib.mkOption {
      default = "kitty";
      example = "myTerminal";
      description = "Terminal to launch using Mod + Enter.";
      type = lib.types.str;
    };
    additionalKeybinds = lib.mkOption {
      default = [ ];
      example = [ "$mod SHIFT, T, pseudo" ];
      description = "Additional keybindings for hyprland.";
      type = lib.types.listOf lib.types.str;
    };

    autostart = lib.mkOption {
      description = "Additional commands to run when starting Hyprland.";
      default = [ ];
      example = [ "echo hi!" ];
    };
    enviornmentVariables = lib.mkOption {
      description = "Additional enviornment variables for Hyprland.";
      default = { };
      example = { MY_ENV = "a string"; };
    };

    hypridle = { enable = lib.mkEnableOption "Hypridle"; };
  };
}
