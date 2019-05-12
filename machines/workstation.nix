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
        ../boot/efi.nix
        # Include DE
        ../desktops/plasma.nix
    ];

  # Boot.
  boot.initrd.luks.devices = [
    {
      name = "root";
      # device = "/dev/sda2";
      device = "/dev/sda3";
      preLVM = true;  
    }
  ];
  
  
  # Networking
  systemd.services.systemd-user-sessions.enable = false; 

  networking.dhcpcd.extraConfig = "noarp";

  networking.firewall.enable = false;

  networking.hostName = "nixos-marco-prova-efi"; 

  # Enable Docker
  virtualisation.docker.enable = true;

}
