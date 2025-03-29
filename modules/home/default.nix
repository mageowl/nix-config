{ const, ... }: {
  imports = [ ./programs ./fonts.nix ./cursor.nix ./directories.nix ];

  home.username = const.username;
  home.homeDirectory = "/home/${const.username}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
