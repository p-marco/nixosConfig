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
    hostName = "probook";
    wireless = {
      enable = false;
    };
  };

  services = {
    printing.enable = true;
    avahi.enable = true;
    avahi.nssmdns = true;
    avahi.publish.enable = true;
    avahi.publish.userServices = true;
    printing.browsing = true;    
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
        enable = false;
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


