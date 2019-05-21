{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        ark
        busybox
        clipmenu
        chromium
        gparted
        firefox
        git
        go
        htop
        inxi
        libreoffice
        lm_sensors
        neofetch
        ntfs3g
        python3
        smartmontools
        vivaldi
        wget
    ];

    nixpkgs.config = {
        allowUnfree = true;
        packageOverrides = pkgs: rec {
            polybar = pkgs.polybar.override {
                i3Support = true;
            };
            libreoffice = pkgs.libreoffice.overrideDerivation (old: {
                NIX_CFLAGS_COMPILE = "-march=native -O2";
            });
        };
    };
}

