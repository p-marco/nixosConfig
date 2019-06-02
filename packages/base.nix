{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        busybox
        clipmenu
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
        oh-my-zsh
        ranger
        rclone 
        rsync 
        smartmontools
        wget
        youtube-dl
        zsh
    ];

    nixpkgs.config.allowUnfree = true;
    
}

