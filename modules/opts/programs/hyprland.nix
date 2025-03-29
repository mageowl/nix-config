{ lib, util, ... }: {
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

		animation = {
			enable = lib.mkEnableOption "Hyprland animations.";
			anim = lib.mkOption {
				description = "List of animations to override.";
				default = { };
				type = lib.types.attrsOf util.types.hyprlandAnimation;
			};
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
    hyprlock = { enable = lib.mkEnableOption "Hyprlock"; };
  };
}
