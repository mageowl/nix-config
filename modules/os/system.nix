{
  pkgs,
  const,
  ...
}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = const.hostname; # Define your hostname.
  nix.settings.experimental-features = ["nix-command" "flakes" "pipe-operators"];

  environment = {
    systemPackages = with pkgs; [
      git
      clang
      rustup
      wl-clipboard
      neovim
      home-manager
      nodejs_23
      unzip
      zip
    ];
    variables.FLAKE = "/home/${const.username}/nix/";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable upower as a dependency for widgets
  services.upower.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
