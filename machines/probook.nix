{ config, pkgs, ... }:

{
  imports =
    [   
        
        # Include the results of the hardware scan :
        ../hardware/probook.nix
        # Include bootloader :
        ../boot/efi.nix
        # General configuration :
        # ../configs/base.nix
        # Packages :
        ../packages/base.nix
        # Fonts : 
        ../fonts/base.nix
        # Users :
        ../users/guest.nix
        ../users/ludmila.nix
    ];

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
      enable = true;
      xkbOptions = "eurosign:e";
      layout = "sk,cz,it,us";
      desktopManager = {
        gnome3 = {
          enable = true;
        };
      };
      displayManager = {
        gdm = {
          enable = true;
            autoLogin = {
            enable = true;
            user = "ludmila";
          };
        };
      };
      synaptics = {
        enable = true;
      };
      windowManager = {
        i3 = {
          enable = false;
          package = pkgs.i3-gaps;
        };
        openbox = {
          enable = false;
        };
      };
    };
      fstrim = {
        enable = true;
      };
  };



  # Enable sound :
  sound.enable = true;
  
  ## CONFIG BASE, DIFFERENT LVM VOLUME

    # Boot.
    boot.initrd.luks.devices = [
      {
        name = "root";
        device = "/dev/sdb3";
        preLVM = true;
      }
    ];

    # Internationalization.
    i18n = {
      consoleFont = "Source Code Pro";
      consoleKeyMap = "it";
      defaultLocale = "en_US.UTF-8";
    };
    
    # Networking.
    networking.dhcpcd.extraConfig = "noarp";

    
    #System.
    system = {
      autoUpgrade = {
        enable = true;
      };
      stateVersion = "19.03";
    }; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";


    security.pam.services.gdm.enableGnomeKeyring = true;



  
}


