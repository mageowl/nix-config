{
  config,
  lib,
  inputs,
  const,
  pkgs,
  ...
}: let
  opts = config.opts;
  ags = inputs.ags;
in {
  imports = [ags.homeManagerModules.default];

  config = lib.mkIf opts.widgets.enable {
    home.packages = [
      pkgs.astal.io
      (pkgs.writers.writeFishBin "reload_ags" ''
        ags quit
        hyprctl dispatch exec ags run
      '')
    ];
    programs.ags = {
      enable = true;
      extraPackages = with ags.packages.${const.system}; [
        mpris
        wireplumber
        hyprland
        apps
        battery
        notifd
        io
        network
        astal3
      ];
    };

    xdg.configFile = let
      inherit (builtins) toString;
      font = opts.theme.fonts.${opts.theme.fonts.default};
    in {
      "ags" = {
        source = "${inputs.widgets}";
        recursive = true;
      };
      "ags/scss/vars.scss" = {
        force = true;
        text = lib.mkForce ''
          $font: ${toString opts.theme.fonts.size.widgets}px ${font.family};
          $fontFeatures: "${builtins.concatStringsSep ", " font.features}";
          $fontKerning: ${toString opts.theme.fonts.kerning}px;

          $bg: rgba(#${opts.theme.col.background.hex}, ${toString opts.theme.backgroundOpacity});
          $bgSecondary: rgba(#${opts.theme.col.foreground.hex}, 0.2);
          $fg: #${opts.theme.col.foreground.hex};
          $fgDim: rgba(#${opts.theme.col.foreground.hex}, 0.4);
          $accent: #${opts.theme.col.accent1.hex};

          $iconSize: ${toString opts.widgets.iconSize}px;

          $border: rgba(#${opts.theme.col.foreground.hex}, ${toString opts.theme.borders.opacity.inactive});
          $borderWidth: ${toString opts.theme.borders.width}px;
          $borderRadius: ${toString opts.theme.rounding.big}px;
          $borderRadiusSmall: ${toString opts.theme.rounding.small}px;

          $componentMargin: ${toString opts.theme.padding.small}px;

          @mixin box {
          	padding: 0 ${toString opts.theme.padding.medium}px;

          	background-color: $bg;
          	background-clip: padding-box;
          	border: $borderWidth solid $border;
          	border-radius: $borderRadius;
          }
        '';
      };
      "ags/config.ts" = {
        text = lib.mkForce ''
          import Config from "./util/confType";

          export default {
            margin: ${toString opts.theme.padding.big},
          } as Config;
        '';
      };
    };
  };
}
