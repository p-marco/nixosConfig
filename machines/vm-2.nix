{ config, lib, pkgs, ... }:

{
  imports =
    [   # Include the results of the hardware scan in fallback scenario, while now include shared configuration.
        # ../hardware-configuration.nix
        # ../hardware/vm2.nix
        ../hardware/fsCommon.nix
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
        # Include external filesystems
        ../hardware/extDevices.nix
    ];

  # Boot.
  boot.tmpOnTmpfs = true;

  # Networking.
  networking.hostName = "vm2"; 

  # nixpkgs.config.stdenv.userHook = '' NIX_CFLAGS_COMPILE+=" -march=native -O2" '';
  nix.maxJobs = lib.mkDefault 2;
  virtualisation.virtualbox.guest.enable = true;
}


