{ lib, ... }:

{
  imports = [ ./programs ./fonts.nix ];

  options = {
    opts = {
      user.name = lib.mkOption {
        default = "NixOS User";
        description = "Human-readable name for the main user.";
      };
    };
  };
}
