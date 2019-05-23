{ config, lib, pkgs, ... }:

{
  imports =
    [   # Include the results of the hardware scan in fallback scenario, while now include shared configuration.
        ../hardware-configuration.nix
        # ../hardware/vm2.nix
        # Include base config
        #../configs/base.nix 
        # Include base packages for root
        # ../packages/base.nix
        # Include fonts
        # ../fonts/base.nix
        # Include users
        # ../users/base.nix
        # ../users/guest.nix
        # Include Bootloader
        ../boot/efi.nix
        # Include Desktop
        # ../desktops/i3.nix
        # ../desktops/compton.nix
        # Include Kernel
        # ../kernels/linux-hardened.nix
        # Include filesystems
        # ../hardware/extDevices.nix
    ];

  # Boot.
  boot.tmpOnTmpfs = true;

  # Networking.
  networking.hostName = "builder"; 

    
  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };

  services.sshd.enable = true;

  environment.systemPackages = with pkgs; [
    git 
    inetutils
    mtr
    sysstat
    nix-deploy
  ];
  
  boot.kernelPackages = pkgs.linuxPackages;
}


