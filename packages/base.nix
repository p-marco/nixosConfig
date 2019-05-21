{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        ark
        busybox
        calibre
        chromium
        clipmenu
        conky
        firefox
        gimp
        git
        go
        gparted
        home-manager
        htop
        imagemagick
        inkscape
        inxi
        libreoffice
        lm_sensors
        mupdf
        neofetch
        ntfs3g
        pandoc
        python3
        ranger
        rxvt_unicode
        smartmontools
        sublime
        vivaldi
        vscode
        wget
        youtube-dl
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

