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
						"/home/${const.username}/" + (if opts.directories.enable && opts.directories.downloads != null
						then opts.directories.downloads
						else "Downloads");
					"browser.tabs.allow_transparent_browser" = true;
					"devtools.debugger.remote-enabled" = true;
				};
				userChrome = with opts.theme; ''
					:root {
						--nix-background: rgba(${col.background.r}, ${col.background.g}, ${col.background.b}, ${backgroundOpacity});
						--nix-font: ${fonts.size.browser}px "${if opts.firefox.monospaceFont then fonts.monospace.family else fonts.sansSerif.family}";
						--nix-font-features: ${if opts.firefox.monospaceFont then fonts.monospace.features else fonts.sansSerif.features}
					}
				'' + builtins.readFile ./userChrome.css;
      };
    };
  };
}
