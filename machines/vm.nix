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
  boot.tmpOnTmpfs = true;

  # Networking.
  networking.hostName = "vm"; 

}


