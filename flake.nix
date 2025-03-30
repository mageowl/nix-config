{
  description = "NixOS and Home Manager configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    widgets = {
      #url = "github:mageowl/widgets";
      url = "path:/home/owl/github/widgets/";
      flake = false;
    };

    # firefox addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nil language server
    nil_ls = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # xremap
    xremap = {
      url = "github:xremap/nix-flake";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;
      util = import ./modules/util { inherit lib inputs; };
    in
    {
      nixosConfigurations.tenebris = util.mkSystem {
        hostname = "tenebris";
        username = "owl";
        system = "x86_64-linux";
        inherit util;
      };

      homeConfigurations."owl@tenebris" = util.mkHome {
        hostname = "tenebris";
        username = "owl";
        system = "x86_64-linux";
        inherit util;
      };
    };
}
