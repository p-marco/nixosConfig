{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan :
      ../hardware/xps.nix
      # Include bootloader :
      ../boot/efi.nix
      # General configuration :
      # ../configs/base.nix
      # Packages :
      ../packages/base.nix
      # Fonts : 
      ../fonts/base.nix
      # Users :
      # ../users/casa.nix
      # ../users/guest.nix
      # ../users/ludmila.nix
      ../users/marco.nix
    ];


  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  
  boot ={
    efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
    supportedFilesystems = [ "ntfs" "fuse" ]; 
    tmpOnTmpfs = true;
  };

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/nvme0n1p2";
      preLVM = true;
    }
  ];

  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [
    "pcie.aspm=force"
    "i915.enable_fbc=1"
    "i915.enable_rc6=7"
    "i915.lvds_downclock=1"
    "i915.enable_guc_loading=1"
    "i915.enable_guc_submission=1"
    "i915.enable_psr=0"
  ];


  networking = {
    hostName = "xps";
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
        gdm = {
          enable = true;
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
  };



  # Enable sound :
  sound.enable = true;
  
  # Enable virtualbox.
  virtualisation.virtualbox.host.enable = true;

  # Enable the Oracle Extension Pack.
  nixpkgs.config.virtualbox.enableExtensionPack = true;



{     
    
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
        layout = "it,us,cz,sk";
      };
    };
    
    #System.
    system = {
      autoUpgrade = {
        enable = true;
      };
      stateVersion = "19.09";
    }; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";




    # services.fstrim.enable = true;
    # 
    # services.xserver.enable = true;
    # services.xserver.xkbOptions = "eurosign:e";
    # services.xserver.layout = "it,us,cz,sk";

}



}
