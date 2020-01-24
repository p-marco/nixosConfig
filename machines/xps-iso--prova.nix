{ config, pkgs, ... }:

{
  imports =
    [ 
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
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

  # Services.

services.xserver.enable = true;
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome3.enable = true;

  # Enable sound :
  sound.enable = true;
  
  # Enable virtualbox.

  # Enable the Oracle Extension Pack.


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








  programs.zsh.promptInit = "";
  services.openssh.enable = false;
  services.printing.enable = true;
  services.dbus.enable = true;

  ##########################################
  ### GNOME SPECIFIC
  ##########################################
  
  
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



  ];

}
