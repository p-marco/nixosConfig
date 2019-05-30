{ config, lib, pkgs, ... }:

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
    busybox
    git 
    home-manager
    htop 
    inxi
    lm_sensors
    neofetch 
    ntfs3g
    rclone 
    rsync 
    smartmontools
    wget 
  ];

  boot.supportedFilesystems = [ "ntfs" "fuse" ];
  
  services.xserver.enable = true;
  services.xserver.xkbOptions = "eurosign:e";

  
  system.stateVersion = "19.03"; # Did you read the comment?
  services.xserver.windowManager.openbox.enable = true;

  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.displayManager.lightdm.autoLogin.enable = true;
  # services.xserver.displayManager.lightdm.autoLogin.user = "casa" ;
  
  services.mingetty.autologinUser = "casa";
  services.sshd.enable = true;


}
