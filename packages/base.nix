{ config, pkgs, ... }:

{

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