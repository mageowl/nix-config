{
  lib,
  util,
  ...
}: {
  options.opts.hyprland = {
    enable = lib.mkEnableOption "Hyprland";

    cursorSize = lib.mkOption {
      description = "Cursor size for Hyprland";
      default = 24;
      example = 24;
      type = lib.types.int;
    };

    layout = lib.mkOption {
      description = "Window layout for Hyprland.";
      default = "dwindle";
      example = "dwindle";
      type = lib.types.str;
    };

    blur = {
      enable = lib.mkEnableOption "blurring behind windows";
      size = lib.mkOption {
        description = "Amount of blur. Adjust blur.passes as well.";
        default = 8;
        example = 8;
        type = lib.types.int;
      };
      passes = lib.mkOption {
        description = "Number of blur passes. Adjust blur.amount as well.";
        default = 2;
        example = 2;
        type = lib.types.int;
      };
      xray = lib.mkOption {
        description = "Enabling this means that transparent windows will always show through to the wallpaper.";
        default = false;
        example = true;
        type = lib.types.bool;
      };
      special = lib.mkOption {
        description = "Whether or not to blur the skrim behind special workspaces.";
        default = false;
        example = true;
        type = lib.types.bool;
      };

      noise = lib.mkOption {
        description = "Amount of noise.";
        default = 0.0;
        example = 0.2;
        type = lib.types.float;
      };
      vibrancy = lib.mkOption {
        description = "Encreases vibrancy of objects behind transparent windows.";
        default = 0.0;
        example = 0.2;
        type = lib.types.float;
      };
    };
    windowShadow = {
      enable = lib.mkEnableOption "shadows around windows";
      range = lib.mkOption {
        description = "Size of shadows.";
        default = 4;
        example = 4;
        type = lib.types.int;
      };
      render_power = lib.mkOption {
        description = "How sharp the shadows are.";
        default = 3;
        example = 3;
        type = lib.types.int;
      };
      sharp = lib.mkOption {
        description = "Enable this to give the effect of an infinite renderPower.";
        default = false;
        example = true;
        type = lib.types.bool;
      };
      ignore_window = lib.mkOption {
        description = "Whether or not to render behind windows.";
        default = false;
        example = true;
        type = lib.types.bool;
      };
      offset.x = lib.mkOption {
        description = "X offset of the shadows.";
        default = 0.0;
        example = 0.0;
        type = lib.types.float;
      };
      offset.y = lib.mkOption {
        description = "Y offset of the shadows.";
        default = 0.0;
        example = 0.0;
        type = lib.types.float;
      };
      scale = lib.mkOption {
        description = "Shadow scaling.";
        default = 1.0;
        example = 0.5;
        type = lib.types.float;
      };

      color = lib.mkOption {
        description = "Shadow color.";
        default = util.hex "000";
        example = lib.literalExpression ''util.hex "000"'';
        type = util.types.color;
      };
      color_inactive = lib.mkOption {
        description = "Shadow color when the window is not focused.";
        default = util.hex "000";
        example = lib.literalExpression ''util.hex "000"'';
        type = util.types.color;
      };
    };

    animation = {
      enable = lib.mkEnableOption "Hyprland animations.";
      anim = lib.mkOption {
        description = "List of animations to override.";
        default = {};
        type = lib.types.attrsOf util.types.hyprlandAnimation;
      };
    };

    mouseSensitivity = lib.mkOption {
      description = "How much to adjust mouse sensitivity. Ranges from -1 to 1.";
      default = 0.0;
      example = 0.5;
      type = lib.types.float;
    };
    naturalScroll = lib.mkEnableOption "natural scrolling";

    monitors = lib.mkOption {
      description = "Monitor configuration for Hyprland.";
      default = [];
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
      default = [];
      example = ["$mod SHIFT, T, pseudo"];
      description = "Additional keybindings for hyprland.";
      type = lib.types.listOf lib.types.str;
    };

    autostart = lib.mkOption {
      description = "Additional commands to run when starting Hyprland.";
      default = [];
      example = ["echo hi!"];
    };
    enviornmentVariables = lib.mkOption {
      description = "Additional enviornment variables for Hyprland.";
      default = {};
      example = {MY_ENV = "a string";};
    };

    plugin.dynamicCursors = {
      enable = lib.mkEnableOption "hypr-dynamic-cursors plugin";
      threshold = lib.mkOption {
        description = "Threshold to enable animation";
        default = 2;
        example = 2;
        type = lib.types.int;
      };
      enableShakeToFind = lib.mkOption {
        description = "Whether shaking the cursor should make it get bigger.";
        default = false;
        example = true;
        type = lib.types.bool;
      };
    };

    hypridle = {
      enable = lib.mkEnableOption "Hypridle";
      dimAfter = lib.mkOption {
        description = "Number of seconds before the displays should dim.";
        default = 150;
        example = 150;
        type = lib.types.int;
      };
      sleepDisplaysAfter = lib.mkOption {
        description = "Number of seconds before the displays should turn off.";
        default = 180;
        example = 180;
        type = lib.types.int;
      };
      suspendAfter = lib.mkOption {
        description = "Number of seconds before the computer should go to sleep.";
        default = 240;
        example = 240;
        type = lib.types.int;
      };
    };
    hyprlock = {
      enable = lib.mkEnableOption "Hyprlock";
      fingerprint = lib.mkEnableOption "fingerprint authentication";
      profilePicture = lib.mkOption {
        description = "Profile picture to show on lock screen.";
        default = null;
        example = lib.literalExpression "./profile.png";
        type = lib.types.nullOr lib.types.path;
      };
    };
  };
}
