{config,  pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true; 
  programs.home-manager.enable = true;
  
  home.packages = [
    pkgs.htop
    pkgs.fortune
    pkgs.gnome3.gnome-desktop
    pkgs.chromium
    pkgs.epiphany
    pkgs.evince
    pkgs.gnome3.gnome-common
    pkgs.gnome3.gnome-control-center
    pkgs.gnome3.gnome-shell
    pkgs.libreoffice
    pkgs.arc-theme
    pkgs.numix-cursor-theme
    pkgs.papirus-icon-theme
  ];
}