{
  config,
  lib,
  pkgs,
  const,
  ...
}: {
  config = lib.mkIf config.opts._1password.enable {
    programs._1password.enable = true;
    programs._1password-gui = {
      enable = true;
      polkitPolicyOwners = [const.username];
    };
  };
}
