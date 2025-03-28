{ config, lib, inputs, const, ... }:
let opts = config.opts; ags = inputs.ags;
in {
  imports = [ ags.homeManagerModules.default ];

  config = lib.mkIf opts.widgets.enable {
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

    home.file = {
      "${config.xdg.configHome}/ags" = {
        source = "${inputs.widgets}";
        recursive = true;
      };
    };
  };
}
