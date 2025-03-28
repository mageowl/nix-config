{ lib, inputs, ... }: {
  mkSystem = { username, hostname, system, util }:
    lib.nixosSystem {
      specialArgs = {
        inherit inputs util;
        const = { inherit username hostname system; };
      };
      modules = [
        ../opts
        ../os
        ../../hosts/${hostname}
        ../../hosts/${hostname}/hardware-configuration.nix
      ];
    };

  mkHome = { username, hostname, system, util }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs { inherit system; };
      extraSpecialArgs = {
        inherit inputs util;
        const = { inherit username hostname system; };
      };
      modules = [ ../opts ../home ../../hosts/${hostname} ];
    };
}
