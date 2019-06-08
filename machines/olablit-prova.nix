{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan :
      /etc/nixos/hardware-configuration.nix
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
      ../users/guest.nix
      # ../users/marco.nix
    ];

  
  boot ={
    supportedFilesystems = [ "ntfs" "fuse" ]; 
    tmpOnTmpfs = true;
  };

  networking = {
    hostName = "olablit";
    wireless = {
      enable = false;
    };
  };

  services = {
      fstrim = {
        enable = true;
      };
    xserver = {
        enable = true;
        xkbOptions = "eurosign:e";
        layout = "it,us,cz,sk";
      desktopManager = {
        gnome3 = {
          enable = false;
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
        home = "/data";
        createHome = true;
        shell = pkgs.zsh;
    };

    fileSystems."/data/Downloads" =
    { 
        fsType = "tmpfs";
        options = ["nofail"];
    };
  
  
  # Enable virtualbox.
  virtualisation.virtualbox.host.enable = true;

  # Enable the Oracle Extension Pack.
  nixpkgs.config.virtualbox.enableExtensionPack = true;

  # Enable Docker.
  virtualisation.docker.enable = true;
}



