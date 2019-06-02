{ config, pkgs, ... }:

{
  imports =
    [   # Include the results of the hardware scan.
        # # ../hardware-configuration.nix
        # ../hardware/easynote.nix
        # # Include base config
        # ../configs/base.nix 
        # # Include packages for root
        # ../packages/base.nix
        # # Include fonts
        # ../fonts/base.nix
        # # Include users
        # ../users/base.nix
        # ../users/guest.nix
        # # Include Bootloader
        # ../boot/grub.nix
        # # Include Desktop
        # ../desktops/i3.nix
        # ../desktops/compton.nix
        # # Include Kernel
        # ../kernels/linux-hardened.nix
        # # Include filesystems
        # ../hardware/extDevices.nix
        
        # Include the results of the hardware scan :
        ../hardware/easynote.nix
        # Include bootloader :
        ../boot/grub.nix
        # General configuration :
        ../configs/base.nix
        # Packages :
        ../packages/base.nix
        # Fonts : 
        ../fonts/base.nix
        # Users :
        ../users/guest.nix
        ../users/marco.nix
    ];

  # Boot.
  boot.tmpOnTmpfs = true;

  # Networking.
  networking.hostName = "easynote"; 
  
  boot ={
    supportedFilesystems = [ "ntfs" "fuse" ]; 
    tmpOnTmpfs = true;
  };

  networking = {
    hostName = "easynote";
    wireless = {
      enable = true;
    };
  };

  services = {
    xserver = {
      desktopManager = {
        gnome3 = {
          enable = false;
        };
      };
      displayManager = {
        lightdm = {
          enable = true;
          autologin = {
            enable = true;
            user = "marco";
          };
        };
      };
      synaptics = {
        enable = true;
      };
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
        openbox = {
          enable = false;
        };
      };
    };
  };




  # Enable sound :
  sound.enable = true;
  

  
}


