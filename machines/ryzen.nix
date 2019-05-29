{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware/ryzen.nix
      ../boot/efi.nix
      ../configure/base.nix
      ../users/casa.nix
      ../users/guest.nix
      ../users/ludmila.nix
      ../users/marco.nix
    ];

  

  networking.hostName = "ryzen"; 



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
    libreoffice
    lm_sensors
    mupdf
    neofetch 
    ntfs3g
    rclone 
    rsync 
    smartmontools
    wget 
    youtube-dl
  ];


  sound.enable = true;
  
  services.xserver.enable = true;
  services.xserver.layout = "it";
  services.xserver.xkbOptions = "eurosign:e";

  
  system.stateVersion = "19.03"; # Did you read the comment?
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;  
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.windowManager.openbox.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  services.xserver.windowManager.i3.enable = true;



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
            material-icons
            powerline-fonts
            source-code-pro
            terminus_font
            ttf_bitstream_vera
            ubuntu_font_family
        ];
        fontconfig = {
            penultimate.enable = false;
            defaultFonts = {
                monospace = [ "Source Code Pro" ];
                sansSerif = [ "Quicksand Medium" ];
                serif     = [ "Source Serif Pro" ];
            };
        };
};


}