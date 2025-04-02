{util, inputs, lib, ...}:
let secrets = inputs.secrets.hosts.tenebris;
in {
  opts = {
    user.name = "owen";
    theme = import ./theme.nix util;

    hyprland = {
      enable = true;

      monitors = [
        (util.mkMonitor {
          name = "eDP-1";
          position = "2560x240";
          scale = 2;
        })
        (util.mkMonitor {
          name = "DP-2";
          position = "0x0";
          scale = 1.5;
        })
      ];

      blur = {
        enable = true;
        size = 8;
        passes = 2;
        xray = true;

        noise = 0.2;
        vibrancy = 0.2;
      };

      animation = {
        enable = true;

        anim = {
          windows = util.mkAnimation {
            duration = 7;
            curve = "custom";
          };
          windowsOut = util.mkAnimation {
            duration = 7;
            style = "popin 50%";
          };
          border = util.mkAnimation {duration = 5;};
          borderangle = util.mkAnimation {duration = 8;};
          fade = util.mkAnimation {duration = 7;};
          workspaces = util.mkAnimation {duration = 6;};
          specialWorkspace = util.mkAnimation {
            duration = 6;
            style = "fade";
          };
        };
      };

      plugin.dynamicCursors = {
        enable = true;
      };
    };

    cli = {
      enableAll = true;

      git = {
        email = "32573897+mageowl@users.noreply.github.com";
        name = "mageowl";
        lazygit.enable = true;
      };
    };

    kitty = {
      enable = true;
      lineSpacing = 2;
      modifier = "alt";
    };

    swww = {
      enable = true;
      wallpaperDir = ./wallpapers;
      cycleEvery = "1h";
    };

    obsidian = {
      enable = true;
      opacity = 0.8;
    };

    firefox = {
      enable = true;
      monospaceFont = true;
      aliases =
        {
          "t" = "data:text/html,<div contenteditable style='color:white;font-family:monospace;font-size:1rem'></div>";
          "canvas/cal" = "https://${secrets.canvasUrl}.instructure.com/calendar";
        }
        // (
          let
            classes = {
              "bio" = "548";
              "eng" = "526";
              "esp" = "539";
              "alg" = "543";
              "hist" = "532";
            };
          in classes
            |> builtins.mapAttrs (name: id: {
              "canvas/c/${name}" = "https://${secrets.canvasUrl}.instructure.com/courses/${id}";
              "canvas/c/${name}/a" = "https://${secrets.canvasUrl}.instructure.com/courses/${id}/assignments";
            })
            |> builtins.attrValues
            |> lib.mergeAttrsList
        );
    };

    directories = {
      enable = true;

      downloads = "downloads";
      documents = "random";
      desktop = null;
      music = "music";
      videos = "recordings";
      extra = [
        "art"
        "godot"
        "github"
        "minecraft"
        "backup"
        "notes"
      ];
    };

    widgets.enable = true;
    helix = import ./helix.nix;
    _1password.enable = true;
    vesktop.enable = true;
    prismLauncher.enable = true;
    steam.enable = true;
    godot.enable = true;
    aseprite.enable = true;

    xremap = {
      enable = true;
      config = {
        modmap = [
          {
            name = "Modifications for built-in keyboard";
            remap.capslock = {
              held = "leftctrl";
              alone = "esc";
            };
            device.only = "event0";
          }
        ];
      };
    };
  };
}
