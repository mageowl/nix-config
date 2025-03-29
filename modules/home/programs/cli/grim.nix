{ config, lib, pkgs, ... }:
let opts = config.opts;
in {
  config = lib.mkIf opts.cli.grim.enable {
    home.packages = with pkgs; [ grim slurp ];
		home.file."screenshots/.keep" = {
			text = "force nix to create directory";
		};
  };
}
