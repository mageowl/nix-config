{ config, lib, ... }:
let cfg = config.opts;
in {
  imports = [ ./lsp.nix ];

  config = lib.mkIf cfg.helix.enable {
    programs.helix = {
			enable = true;
			defaultEditor = true;
      settings = cfg.helix.settings;
      themes = cfg.helix.themes;
		};
  };
}
