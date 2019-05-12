{ config, pkgs, ... }:

{

  services.xserver.enable = true;
  services.xserver.layout = "it";
  services.xserver.xkbOptions = "eurosign:e";

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable autologin
  services.xserver.displayManager.sddm.autoLogin.enable = true;
  services.xserver.displayManager.sddm.autoLogin.user = "marco";

}