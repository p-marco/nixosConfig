{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan :
      ../hardware/olablit.nix
      # ../hardware/olablit.nix
      # Include bootloader :
      ../boot/efi.nix
      # General configuration :
      # ../configs/base.nix
      # Packages :
      ../packages/base.nix
      # Fonts : 
      ../fonts/base.nix
      # Users :
      # ../users/guest.nix
      # ../users/marco.nix
    ];

  
  boot ={
    supportedFilesystems = [ "ntfs" "fuse" ]; 
    tmpOnTmpfs = true;
    initrd.luks.devices = [
      {
        name = "system";
        device = "/dev/sda3";
        preLVM = true;
        keyFile = "/dev/disk/by-path/pci-0000:00:14.0-usb-0:12:1.0-scsi-0:0:0:0";
        allowDiscards = true;
	keyFileSize = 4096;
	keyFileOffset = 0;
	fallbackToPassword = true;
      }
    ];
  };

  networking = {
    hostName = "olablit";
    wireless = {
      enable = false;
    };
  };

  services = {
      fstrim = {
        enable = false;
      };
    xserver = {
        enable = true;
        xkbOptions = "eurosign:e";
        layout = "it,us,cz,sk";
      desktopManager = {
        gnome3 = {
          enable = false;
        };
        xfce ={
          enable = true;
        };
      };
      displayManager = {
        lightdm = {
          enable = true;
          autoLogin = {
            enable = false;
          };
        };
      };
      synaptics = {
        enable = false;
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

    # User section.
    users.users.marco = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" "video" ]; 
        home = "/private/home";
        createHome = true;
        shell = pkgs.zsh;
    };


    users.users.processes = {
        isNormalUser = true;
        extraGroups = ["docker" "video" "www-data" "apache" ]; 
        home = "/var/processes";
        createHome = true;
        shell = pkgs.zsh;
    };  
   
    users.users.guest = {
    	isNormalUser = true;
	home = "/home/guest";
	createHome = true;
	shell = pkgs.zsh;
    };
  
  # Enable virtualbox.
  virtualisation.virtualbox.host.enable = true;

  # Enable the Oracle Extension Pack.
  nixpkgs.config.virtualbox.enableExtensionPack = true;

  # Enable Docker.
  virtualisation.docker.enable = true;
  
  # Enable sshd.
  services.sshd.enable = true;
}



