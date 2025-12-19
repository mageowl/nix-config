{
  config,
  lib,
  pkgs,
  # inputs,
  # const,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.blender.enable {
    # nixpkgs.overlays = [
    #   (final: prev: {
    #     blender = prev.blender.overrideAttrs (old: {
    #       version = "4.1.1";
    #       src = prev.fetchzip {
    #         name = "source";
    #         url = "https://download.blender.org/source/blender-4.1.1.tar.xz";
    #         hash = "sha256-/GUIuhFSZVrGqepi2EuLheTzkucUtBG3PYZ2cFxK3dw=";
    #       };
    #     });
    #   })
    # ];

    home.packages = [pkgs.blender];
  };
}
