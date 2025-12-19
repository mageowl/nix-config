{
  config,
  lib,
  inputs,
  const,
  ...
}: let
  cfg = config.opts;
in {
  imports = [./lsp.nix ./theme.nix];

  config = lib.mkIf cfg.helix.enable {
    programs.helix = {
      enable = true;
      package = inputs.helix.packages.${const.system}.helix;
      defaultEditor = true;

      settings = {theme = "nix";} // cfg.helix.settings;
      languages = {
        language = cfg.helix.languages;
        language-server = cfg.helix.lsp;
      };
    };
  };
}
