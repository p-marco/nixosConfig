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
      desktopManager = {
        gnome3 = {
          enable = true;
        };
      };
      displayManager = {
        lightdm = {
          enable = true;
          autoLogin = {
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
          enable = false;
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

    # Services.
    services = {
      fstrim = {
        enable = true;
      };
      xserver = {
        enable = true;
        xkbOptions = "eurosign:e";
        layout = "sk,cz,it,us";
      };
    };
    
    #System.
    system = {
      autoUpgrade = {
        enable = true;
      };
      stateVersion = "19.03";
    }; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";


  
}


