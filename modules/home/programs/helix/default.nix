{
  config,
  lib,
  ...
}: let
  cfg = config.opts;
in {
  imports = [./lsp.nix ./theme.nix];

  config = lib.mkIf cfg.helix.enable {
    programs.helix = {
      enable = true;
      defaultEditor = true;

      settings = {theme = "nix";} // cfg.helix.settings;
      languages = {
        language = cfg.helix.languages;
        language-server = cfg.helix.lsp;
      };
    };
  };
}
