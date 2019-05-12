# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:



{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include I3
      ./desktops/i3.nix
      # Include base packages for root
      ./packages/base.nix
      # Include fonts
      ./fonts/base.nix
      # Include users
      ./users/base.nix
      # Include GRUB Boot
      ./boot/grub.nix
    ];

  # Boot.
  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/sda3";
      preLVM = true;
    }
  ];


  # Internationalization.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "it";
  };


  # Networking.
  networking.hostName = "nixos-marco"; # Define your hostname.


  # Services.
  services.fstrim.enable = true;

  # Enable sound.
  sound.enable = true;

  #System.
  system.autoUpgrade.enable = true;
  system.stateVersion = "19.03"; 

  # Timezone.
  time.timeZone = "Europe/Prague";


}


