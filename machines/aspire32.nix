{ config, pkgs, ... }:

{
  imports =
    [   # Include the results of the hardware scan.
        ../hardware-configuration.nix
        # Include base config
        ../configs/base.nix 
        # Include packages for root
        ../packages/base.nix
        # Include fonts
        ../fonts/base.nix
        # Include users
        ../users/base.nix
        # ../users/guest.nix
        # Include Bootloader
        ../boot/grub.nix
        # Include Desktop
        ../desktops/i3.nix
        # ../desktops/compton.nix
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
  networking.hostName = "aspire32"; 
  networking.wireless.enable = true;
  services.xserver.synaptics.enable = true;
  programs.light.enable = true;

  nixpkgs.config.allowUnsupportedSystem = true;
  stdenv.userHook = '' NIX_CFLAGS_COMPILE+=" -march=native -O2" '';
}


