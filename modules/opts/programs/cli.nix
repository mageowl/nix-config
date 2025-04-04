{lib, ...}: {
  options.opts.cli = {
    enableAll = lib.mkEnableOption "command line tools";

    nh.enable = lib.mkEnableOption "Yet Another Nix Helper";
    grim.enable = lib.mkEnableOption "screenshot utilities";
    misc.enable = lib.mkEnableOption "miscellaneous command line tools";
    nushell.enable = lib.mkEnableOption "NuShell";

    git = {
      enable = lib.mkEnableOption "Git";
      email = lib.mkOption {
        description = "Email to use for Git contributions.";
        example = "owen@example.com";
      };
      name = lib.mkOption {
        description = "Name to use for Git contributions.";
        example = "mageowl";
      };
      defaultBranch = lib.mkOption {
        description = "Default branch name for new repositories.";
        default = "main";
        example = "main";
      };

      lazygit.enable = lib.mkEnableOption "LazyGit helper";
    };
  };
}
