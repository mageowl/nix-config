{
  lib,
  config,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.hyprland.hyprlock.enable {
    programs.hyprlock = {
      enable = true;
      settings = let
        font = opts.theme.fonts.${opts.theme.fonts.default};
      in
        lib.mkMerge [
          {
            auth = {
              fingerprint.enabled = opts.hyprland.hyprlock.fingerprint;
            };

            label = [
              {
                text = "$TIME";

                font_family = font.family + " ExtraBold Italic";
                font_size = 96;
                color = "rgba(${opts.theme.col.foreground.rgb}, 0.3)";

                position = "0, -256";
                halign = "center";
                valign = "top";
              }
            ];

            shape = [
              {
                size = "512, 88";

                color = "rgba(${opts.theme.col.background.rgb}, 0.6)";
                rounding = 100;

                position = "0, 128";
                halign = "center";
                valign = "bottom";
              }
            ];

            image =
              [
                {
                  path = builtins.toString (
                    if opts.hyprland.hyprlock.fingerprint
                    then ./fingerprint.png
                    else ./lock.png
                  );

                  border_size = 0;
                  size = 64;

                  position = "212, 140";
                  halign = "center";
                  valign = "bottom";
                }
              ]
              ++ lib.optionals (opts.hyprland.hyprlock.profilePicture != null) [
                {
                  path = builtins.toString opts.hyprland.hyprlock.profilePicture;

                  border_size = 0;

                  position = "0, 256";
                  halign = "center";
                  valign = "bottom";
                }
              ];

            input-field = [
              {
                size = "476, 88";

                dots_size = 0.2;
                dots_spacing = 0.4;
                dots_center = false;
                font_color = "rgb(${opts.theme.col.foreground.rgb})";
                font_family = font.family;
                font_size = 96;
                inner_color = "rgba(0, 0, 0, 0)";
                fail_color = "rgba(0, 0, 0, 0)";
                outline_thickness = 0;
                fade_on_empty = false;

                position = "-18, 128";
                halign = "center";
                valign = "bottom";
              }
            ];
          }
          (lib.mkIf
            opts.swww.enable
            {source = ["/tmp/hyprlock-bg.conf"];})
        ];
    };
  };
}
