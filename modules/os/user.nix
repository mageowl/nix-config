# @mageowl's primary user

{ config, pkgs, const, ... }: {
  users.users.${const.username} = {
    isNormalUser = true;
    description = config.opts.user.name;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
}
