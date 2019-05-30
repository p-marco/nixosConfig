{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.feh
  ];
  
  # xsession.enable = true;
  # xsession.windowManager.command = "exec openbox-session";

  programs.feh.enable = true;
}
