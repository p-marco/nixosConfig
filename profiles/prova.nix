# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmpOnTmpfs = true;
  
  # Kernel 
  boot.kernelPackages = pkgs.linuxPackages_hardened;
  security.hideProcessInformation = true;
  security.lockKernelModules = true;
  security.allowUserNamespaces = true;
  security.protectKernelImage = true;
  security.allowSimultaneousMultithreading = false;
  security.virtualization.flushL1DataCache = "always";
  security.apparmor.enable = true; 

  # Networking
  systemd.services.systemd-user-sessions.enable = false; 
  networking.dhcpcd.extraConfig = "noarp";

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Prague";
  # Set hostname
  # networking.hostName = "";

 
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "it";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable autologin
  services.xserver.displayManager.sddm.autoLogin.enable = true;
  services.xserver.displayManager.sddm.autoLogin.user = "marco";

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

  # Boot Encrypted LVM
  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/sda2";
      preLVM = true;  
    }
  ];

  
  # Packages
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  # Package list
  environment.systemPackages = with pkgs; [
    ark
    chromium
    docker
    firefox
    git
    go
    google-fonts
    htop
    lm_sensors
    neofetch

    wget
  ];
  # Enable Docker
  virtualisation.docker.enable = true;
  # Automatic upgrades
  system.autoUpgrade.enable = true;

  # Home Manager 
  #home-manager.useUserPackages = true;

  # User section.
  users.users.marco = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    home = "/home/marco";
    packages = with pkgs; [
      calibre
      gimp
      home-manager
      inkscape
      libreoffice
      okular
      pandoc
      sublime
      vscode
      youtube-dl
    ];

  };
  

}
