{
  config,
  lib,
  ...
}: let
  opts = config.opts;
in {
  config = lib.mkIf opts.cli.git.enable {
    programs.git = {
      enable = true;
      userEmail = opts.cli.git.email;
      userName = opts.cli.git.name;
      includes = [
        {
          # Set Codeberg to use SSH
          condition = "hasconfig:remote.*.url:https://codeberg.org/**";
          contents = {
            gpg.format = "ssh";
            commit.gpgSign = true;
            user.signingKey = "~/.ssh/id_ed25519.pub";
          };
        }
      ];

      extraConfig = {
        init.defaultBranch = opts.cli.git.defaultBranch;
        pull.rebase = false;
      };
    };
    programs.lazygit = lib.mkIf opts.cli.git.lazygit.enable {
      enable = true;
    };
  };
}
