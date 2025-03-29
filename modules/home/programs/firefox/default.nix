{ config, lib, inputs, pkgs, const, ... }:
let
  opts = config.opts;
  addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in {
  config = lib.mkIf opts.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles.${const.username} = {
        extensions.packages = with addons; [ ublock-origin sponsorblock ];
				settings = {
					"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
					"browser.download.dir" =
						"/home/${const.username}/" + (if opts.directories.enable && opts.directories.downloads != null then opts.directories.downloads else "Downloads");
				};
      };
    };
  };
}
