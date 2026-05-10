{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../users/darrenb
  ];

  networking.hostName = "nixos";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/d1cddcb6-689b-4a7d-9ce9-4660e2bb2bde";
    fsType = "btrfs";
  };

  system.stateVersion = "25.11";
}
