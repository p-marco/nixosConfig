{ config, pkgs, ... }:

{
  imports =
    [   # Include the results of the hardware scan.
        ../hardware-configuration.nix
        # Include base config
        ../configs/base.nix 
        # Include base packages for root
        ../packages/base.nix
        # Include fonts
        ../fonts/base.nix
        # Include users
        ../users/base.nix
        # Include GRUB Boot
        ../boot/grub.nix
        # Include I3
        ../desktops/i3.nix
    ];

  # Boot.
  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/sda3";
      preLVM = true;
    }
  ];

  # Networking.
  networking.hostName = "nixos-marco-vm"; # Define your hostname.

}


