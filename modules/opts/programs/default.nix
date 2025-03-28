{ lib, ... }: {
  imports = [ ./hyprland.nix ./cli.nix ./widgets.nix ./neovim.nix ];

  options.opts = {
    kitty.enable = lib.mkEnableOption "kitty terminal";
    _1password.enable = lib.mkEnableOption "1Password";
    firefox.enable = lib.mkEnableOption "Firefox";

    swww = { enable = lib.mkEnableOption "wallpapers"; };
  };
}
