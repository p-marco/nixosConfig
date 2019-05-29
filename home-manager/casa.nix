{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.feh
  ];
  
  xsession.enable = true;
  xsession.windowManager.openbox.enable = true; 

  programs.feh.enable = true;
}