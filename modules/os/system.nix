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
      gcc
      rustup
      zig
      wl-clipboard
      neovim
      home-manager
      nodejs_latest
      unzip
      zip
      lm_sensors
    ];
    variables = {
      NH_FLAKE = "/home/${const.username}/nix/";
      XDG_CONFIG_HOME = "/home/${const.username}/.config/";
      GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable upower as a dependency for widgets
  services.upower.enable = true;

  # Virtual machines
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["user-with-access-to-virtualbox"];

  # Hardware video acceleration
  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
  };
  hardware.graphics = {
    # hardware.graphics since NixOS 24.11
    enable = true;

    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
    ];
  };
  environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";}; # Force intel-media-driver
  services.seatd.enable = true;

  # firmware update
  services.fwupd.enable = true;

  # newest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [gutenprint brlaser];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
