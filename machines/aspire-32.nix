{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware/aspire32.nix
      ../boot/grub.nix
      ../configs/minimal.nix
      ../users/casa.nix
      ../users/guest.nix
      ../users/ludmila.nix
      ../users/marco.nix
    ];

  

  networking.hostName = "aspire32"; 



  environment.systemPackages = with pkgs; [
    ark
    busybox
    firefox 
    git 
    go
    gparted
    home-manager
    htop 
    imagemagick
    inxi
    lm_sensors
    mupdf
    neofetch 
    ntfs3g
    rclone 
    rsync 
    smartmontools
    wget 
    youtube-dl
    vlc
  ];

  boot.supportedFilesystems = [ "ntfs" "fuse" ];
  sound.enable = true;
  
  services.xserver.enable = true;
  services.xserver.xkbOptions = "eurosign:e";

  
  system.stateVersion = "19.03"; # Did you read the comment?
  services.xserver.windowManager.openbox.enable = true;

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.enable = true;
  services.xserver.displayManager.lightdm.autoLogin.user = "casa" ;
  services.sshd.enable = true;


}
