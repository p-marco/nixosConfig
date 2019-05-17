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
        libreoffice
        lm_sensors
        neofetch
        python3
        vivaldi
        wget
    ];

    nixpkgs.config = {
        allowUnfree = true;
        packageOverrides = pkgs: rec {
            polybar = pkgs.polybar.override {
                i3Support = true;
            };
        };
    };
}