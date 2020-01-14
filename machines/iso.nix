{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan :
      # ../hardware/xps.nix
      # Include bootloader :
      # ../boot/efi.nix
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

      # LIVE
      <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
      # Provide an initial copy of the NixOS channel so that the user
      # doesn't need to run "nix-channel --update" first.
      <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
    ];


  # fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
  
  # fileSystems."/boot/efi" = ... # ← mount your ESP here instead of at /boot/.
  
  boot ={
    supportedFilesystems = [ "ntfs" "fuse" ]; 
    tmpOnTmpfs = true;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
      };
      grub = {
        efiSupport = true;
        efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
        device = "nodev";
      };
    };
  };

    
  
  # Boot.

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
      libinput = {
        enable = true;
        tapping = false;
        disableWhileTyping = true;
        scrollMethod = "twofinger";
        naturalScrolling = false;
      };
    };
  };

    
  # Enable sound :
  sound.enable = true;
  
  # Enable virtualbox.
  virtualisation.virtualbox.host.enable = true;

  # Enable the Oracle Extension Pack.
  nixpkgs.config.virtualbox.enableExtensionPack = true;


    networking.wireless.enable = false;
    networking.hostName = "xps";

     
    

    # Internationalization.
    i18n = {
      consoleFont = "Source Code Pro";
      consoleKeyMap = "it";
      defaultLocale = "en_US.UTF-8";
    };
    

    # Services.

    #System.
    system = {
      autoUpgrade = {
        enable = true;
      };
      stateVersion = "19.09";
    }; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";

  services.printing.enable = true;
  services.dbus.enable = true;
  services.acpid.enable = true;
  services.upower.enable = true;
  services.tlp.enable = true;



}
