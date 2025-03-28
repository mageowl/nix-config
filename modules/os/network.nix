# Networking: wifi, bluetooth, etc

{ config, pkgs, lib, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;
  # Disable firewall
  networking.firewall.enable = false;

  hardware.bluetooth.enable = true;
}
