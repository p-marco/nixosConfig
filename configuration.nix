# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:



{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  environment.pathsToLink = [ "/libexec" ]; 
  
  services.xserver = {
    enable = true;
    layout = "it";

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        feh
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
        polybar
        rofi
        (python3Packages.py3status.overrideAttrs (oldAttrs: {
          propagatedBuildInputs = [ python3Packages.pytz python3Packages.tzlocal ];
        }))
     ];
    };
  };
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;

  boot.loader.grub.device = "/dev/sda"; 

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/sda3";
      preLVM = true;
    }
  ];

  services.xserver.windowManager.i3.package = pkgs.i3-gaps; 
  
  networking.hostName = "nixos-marco"; # Define your hostname.


  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";


  # Enable sound.
  sound.enable = true;

  system.stateVersion = "19.03"; 


  # Packages
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3Support = true;
      };
    };
  };
  
  # Package list
  environment.systemPackages = with pkgs; [
    ark
    clipmenu
    chromium
    docker
    firefox
    git
    go
    htop
    lm_sensors
    neofetch
    pcmanfm
    python3
    (polybar.override { i3Support = true; })
    vivaldi
    wget
  ];


  # Automatic upgrades
  system.autoUpgrade.enable = true;


  # User section.
  users.users.marco = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    home = "/home/marco";
    packages = with pkgs; [
      calibre
      conky
      gimp
      home-manager
      inkscape
      libreoffice
      mupdf
      pandoc
      ranger
      rxvt_unicode
      sublime
      vscode
      youtube-dl
    ];
  };
 
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      anonymousPro
      corefonts
      dejavu_fonts
      fira-code
      fira-code-symbols
      font-awesome_5
      freefont_ttf
      google-fonts
      inconsolata
      liberation_ttf
      powerline-fonts
      source-code-pro
      terminus_font
      ttf_bitstream_vera
      ubuntu_font_family

    ];
  };

  services.xserver.windowManager.default = "i3";

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.user = "marco";
  

  services.fstrim.enable = true;
  # services.compton.enable = true;
  # services.compton.shadow = true;
  # services.compton.inactiveOpacity = "0.8";
}


