{ config, pkgs, ... }:

{
  imports =
    [   # Include the results of the hardware scan.
        ../hardware-configuration.nix
        # Include base config
        ../configs/base.nix 
        # Include base packages for root
        ../packages/base.nix
        ../packages/codingList.nix
        # Include fonts
        ../fonts/base.nix
        # Include users
        ../users/base.nix
        ../users/guest.nix
        # Include Bootloader
        ../boot/grub.nix
        # Include Desktop
        ../desktops/i3.nix
        ../desktops/compton.nix
        # Include Kernel
        ../kernels/linux-hardened.nix
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
  networking.hostName = "nixos-marco-vm"; 

}


