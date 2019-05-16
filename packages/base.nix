{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        ark
        clipmenu
        chromium
        firefox
        git
        go
        htop
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