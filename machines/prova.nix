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
        ../boot/grub.nix
        # Include Desktop
        ../desktops/plasma.nix
    ];

  # Boot.
  boot.tmpOnTmpfs = true;
  
  
  # Networking
  systemd.services.systemd-user-sessions.enable = false; 

  networking.dhcpcd.extraConfig = "noarp";

  networking.firewall.enable = false;

  networking.hostName = "prova"; 

  # Enable Docker
  virtualisation.docker.enable = true;

}
