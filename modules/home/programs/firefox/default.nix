{ config, lib, inputs, pkgs, const, ... }:
let
  opts = config.opts;
  addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in {
  config = lib.mkIf opts.firefox.enable {
    programs.firefox = {
      enable = true;
      profiles.${const.username} = {
        extensions.packages = with addons; [ ublock-origin sponsorblock indie-wiki-buddy ];
				bookmarks = {
					force = true;
					settings = [
						
					] ++ (opts.firefox.aliases
						|> builtins.mapAttrs (name: url: {
							inherit name url;
							keyword = name;
						})
						|> builtins.attrValues);
				};
				settings = {
					"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
					"browser.download.dir" =
						"/home/${const.username}/" + (if opts.directories.enable && opts.directories.downloads != null
						then opts.directories.downloads
						else "Downloads");
					"browser.tabs.allow_transparent_browser" = true;
					"sidebar.verticalTabs" = true;
					"browser.uiCustomization.navBarWhenVerticalTabs" = ''
						["sidebar-button","back-button","forward-button","stop-reload-button","vertical-spacer","urlbar-container","downloads-button","unified-extensions-button"]
					'';
					"devtools.debugger.remote-enabled" = true;
					"devtools.chrome.enabled" = true;
					"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
				};
				userChrome = with opts.theme; ''
					:root {
						--nix-background: rgba(${col.background.rgb}, ${builtins.toString backgroundOpacity});
						--nix-color: rgb(${col.foreground.rgb});
						--nix-font: ${builtins.toString fonts.size.browser}px "${opts.theme.fonts.${opts.theme.fonts.default}.family}";
						--nix-font-features: ${
							(opts.theme.fonts.${opts.theme.fonts.default}.features)
								|> builtins.map (f: ''"${f}"'')
								|> builtins.concatStringsSep ", "
						};
						--nix-rounding-small: ${builtins.toString rounding.small}px;
						--nix-padding-small: ${builtins.toString padding.small}px;
					}
				'' + builtins.readFile ./userChrome.css;
      };
    };
  };
}
