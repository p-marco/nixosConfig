{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
  
  xsession.enable = true; 
  xsession.windowManager.i3 = {
    enable = true; 
    package = pkgs.i3-gaps;
  };

  home.packages = [
    pkgs.arc-theme
    pkgs.betterlockscreen
    pkgs.chromium
    pkgs.dmenu #application launcher most people use
    pkgs.dunst
    pkgs.feh
    pkgs.firefox
    pkgs.i3blocks 
    pkgs.i3lock 
    pkgs.i3status 
    # pkgs.libreoffice
    pkgs.light
    pkgs.lxappearance
    pkgs.neofetch 
    pkgs.numix-cursor-theme
    pkgs.papirus-icon-theme
    pkgs.pcmanfm
    pkgs.rofi 
    pkgs.vscode
    pkgs.zathura
    pkgs.clipmenu
    pkgs.rxvt_unicode
    pkgs.vscode
    pkgs.sublime
    pkgs.tty-clock
    pkgs.gimp
    pkgs.inkscape
    pkgs.pandoc
  ];
  

  services.polybar.enable = true;
  services.polybar.package = pkgs.polybar.override { i3GapsSupport = true; };
  services.polybar.script = " " ;
  programs.rofi.enable = true; 
  programs.feh.enable = true;

  services.compton = {
    enable = true;
    backend = "glx";
    vSync = "opengl-swc";
    extraOptions = ''
        paint-on-overlay = true;
        blur-background   = true;
        shadow = true;
        no-dnd-shadow = true;
        no-dock-shadow = true;
        clear-shadow = true;
        shadow-radius = 10;
        shadow-offset-x = -10;
        shadow-offset-y = -10;
        shadow-exclude = [
          "class_g = 'conky'",
          "class_g = 'Conky'"
        ];
    '';
  };

  home.keyboard.layout = "it,us,cz,sk";


}
