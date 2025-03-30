{ lib, config, ... }:
{
  imports = [
    ./hyprland.nix
    ./cli.nix
    ./widgets.nix
    ./helix.nix
    ./fish.nix
    ./xremap.nix
  ];

  options.opts = {
    kitty = {
      enable = lib.mkEnableOption "kitty terminal";

      lineSpacing = lib.mkOption {
        description = "Modifies cell height.";
        default = 0;
        example = 2;
        type = lib.types.int;
      };
      modifier = lib.mkOption {
        description = "Default modifier for shell keybindings.";
        default = "ctrl+shift";
        example = "alt";
        type = lib.types.str;
      };
    };

    firefox = {
      enable = lib.mkEnableOption "Firefox";
      monospaceFont = lib.mkOption {
        description = "Use a monospace font instead of the sans serif one.";
        default = false;
        example = true;
        type = lib.types.bool;
      };
    };

    prismLauncher = {
      enable = lib.mkEnableOption "Prism Launcher";
      instancesDirectory = lib.mkOption {
        description = "Where to put the instances folder.";
        default = "${config.home.homeDirectory}/minecraft/instances";
        example = "/home/nixos-user/minecraft/instances";
        type = lib.types.str;
      };
    };

    _1password.enable = lib.mkEnableOption "1Password";
    vesktop.enable = lib.mkEnableOption "Vesktop";
    obsidian = {
      enable = lib.mkEnableOption "Vesktop";
      opacity = lib.mkOption {
        description = "Opacity of the entire Obsidian window.";
        default = 1.0;
        example = 0.8;
        type = lib.types.float;
      };
    };

    swww = {
      enable = lib.mkEnableOption "wallpapers";
      wallpaperDir = lib.mkOption {
        description = "Path to wallpapers.";
        example = lib.literalExpression "./wallpapers";
        type = lib.types.path;
      };
      cycleEvery = lib.mkOption {
        description = "The delay at which to change wallpapers.";
        example = lib.literalExpression "1h";
        default = null;
        type = lib.types.nullOr lib.types.str;
      };
    };
  };
}
