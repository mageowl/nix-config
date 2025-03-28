{ config, lib, pkgs, const, ... }: {
	config = lib.mkIf config.opts._1password.enable {
		users.users.${const.username}.packages = [ pkgs._1password-gui ];
	};
}
