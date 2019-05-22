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
        # Include Bootloader
        ../boot/efi.nix
        # Include Desktop
        ../desktops/plasma.nix
    ];

  
  
  # Networking
  systemd.services.systemd-user-sessions.enable = false; 


  networking.firewall.enable = false;

  networking.hostName = "workstation"; 

  # Enable Docker
  virtualisation.docker.enable = true;

}
