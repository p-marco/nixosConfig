{ config, pkgs, ... }:

{
  imports =
    [ 
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
    
     <nixos-hardware/dell/xps/13-9380>     

        # Include the results of the hardware scan :
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
      # ../users/marco.nix

    ];


  # fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  
  boot ={
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
    supportedFilesystems = [ "ntfs" "fuse" ]; 
    tmpOnTmpfs = true;
  };

#  boot.initrd.luks.devices = [
#    {
#      name = "root";
#      device = "/dev/nvme0n1p2";
#      preLVM = true;
#    }
#  ];
    
  
  # Boot.

  #  boot.kernelModules = [ "kvm-intel" "ath10k_pci" "btusb" "intel_wmi_thunderbolt" "iwlwifi" ];
  #  boot.kernelParams = [
  #  "pcie.aspm=force"
  #  "i915.enable_fbc=1"
  #  "i915.enable_rc6=7"
  #  "i915.lvds_downclock=1"
  #  "i915.enable_guc_loading=1"
  #  "i915.enable_guc_submission=1"
  #  "i915.enable_psr=0"
  #  "mem_sleep_default=deep"
  # ];

  boot.kernelPackages = pkgs.linuxPackages_5_4 ;
  
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
          # enable = true;
          enable = false;
        };
      };
      displayManager = {
        gdm = {
          # enable = true;
          enable = false;
        };
        lightdm.enable = true;
      };
      synaptics = {
        enable = false;
      };
      windowManager = {
        i3 = {
          # enable = false;
          enable = true;
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

  users.users.root.password = "root";
  users.users.marco.password = "marco"; 
   
  # Enable sound :
  sound.enable = true;
  
  # Enable virtualbox.
  #  virtualisation.virtualbox.host.enable = true;

  # Enable the Oracle Extension Pack.
  # nixpkgs.config.virtualbox.enableExtensionPack = true;


  networking.wireless.enable = false;
  networking.hostName = "xps";

     
    

    # Internationalization.
    i18n = {
      consoleFont = "Terminus 16x32";
      consoleKeyMap = "it";
      defaultLocale = "en_US.UTF-8";
    };
    
    console.font = "Terminus 16x32";
    # Services.

    #System.
    system = {
      autoUpgrade = {
        enable = true;
      };
      stateVersion = "20.03";
    }; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";




  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "ondemand"; # will be managed by tlp
  #  powerManagement.cpuFreqGovernor = null; # will be managed by tlp
  powerManagement.powerUpCommands = ''
    echo XHC > /proc/acpi/wakeup
  '';



  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.pulseaudio.extraConfig = "load-module module-switch-on-connect";
  hardware.bluetooth.enable = true;
  hardware.bluetooth.extraConfig = ''
    [general]
    Enable=Source,Sink,Media,Socket
  '';





  programs.zsh.promptInit = "";
  #  services.openssh.enable = false;
  services.printing.enable = true;
  services.dbus.enable = true;
  services.acpid.enable = true;
  services.upower.enable = true;
#  services.tlp.enable = true;
  # services.gnome3.gnome-documents.enable = false;
  # services.gnome3.gnome-online-accounts.enable = false;
  # services.gnome3.gnome-online-miners.enable = false;
  # services.gnome3.gnome-user-share.enable = false;
  # services.gnome3.evolution-data-server.enable = lib.mkForce false;
  # services.packagekit.enable = false;


  ##########################################
  ### GNOME SPECIFIC
  ##########################################
  
  environment.gnome3.excludePackages = [
    pkgs.gnome3.epiphany
    pkgs.gnome3.totem
    pkgs.gnome3.vino
    pkgs.gnome3.yelp
    pkgs.gnome3.evolution-data-server
    pkgs.gnome3.evolution
    pkgs.gnome3.gnome-music
    pkgs.gnome3.gnome-software
    pkgs.gnome3.simple-scan
    # pkgs.gnome3.gnome-packagekit
    pkgs.gnome3.gnome-maps
    # pkgs.gnome3.gnome-system-log
    pkgs.gnome3.gnome-user-docs
    pkgs.gnome3.gnome-weather
    pkgs.gnome3.baobab
    pkgs.gnome3.accerciser
  ];

  programs.dconf.enable = true;

  nixpkgs.config.firefox.enableGnomeExtensions = true;
  services.gnome3.chrome-gnome-shell.enable = true;

  ##########################################
  ### USERS
  ##########################################


  users.users.marco = {
    isNormalUser = true;
    createHome = true;
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" "plugdev" "dialout"];
    shell = pkgs.zsh;
  };

  ##########################################
  ### OTHER PACKAGES
  ##########################################


  environment.systemPackages = with pkgs; [
    gnome3.gnome-tweaks
    gnome3.gnome-shell-extensions
    slack
    # tdesktop
    skypeforlinux


    gnomeExtensions.arc-menu
    gnomeExtensions.dash-to-panel
    gnomeExtensions.dash-to-dock
    #gnomeExtensions.clipboard-indicator
    #gnomeExtensions.no-title-bar
    gnomeExtensions.gsconnect




  ];

services.thermald.enable = true;
services.fwupd.enable = true;

}
