{ config, lib, pkgs, ... }:
let cfg = config.opts;
in {
  imports = [ ./lsp.nix ];

  config = lib.mkIf cfg.nvim.enable {
    programs.neovim.enable = true;
  };
}
