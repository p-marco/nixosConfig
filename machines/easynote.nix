{ config, pkgs, ... }:

{
  imports =
    [   # Include the results of the hardware scan.
        # ../hardware-configuration.nix
        ../hardware/easynote.nix
        # Include base config
        ../configs/base.nix 
        # Include packages for root
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
        # Include filesystems
        ../hardware/extDevices.nix
    ];

  # Boot.
  boot.tmpOnTmpfs = true;

  # Networking.
  networking.hostName = "easynote"; 
  

  
}


