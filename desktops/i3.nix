{ config, pkgs, ... }:

{
    environment.pathsToLink = [ "/libexec" ]; 

    services.xserver = {
        enable = true;
        

        desktopManager = {
            default = "none";
            xterm.enable = false;
        };

        windowManager.i3 = {
            enable = true;
            extraPackages = with pkgs; [
                arc-theme
                dmenu #application launcher most people use
                dunst
                feh
                i3status # gives you the default i3 status bar
                i3lock #default i3 screen locker
                i3blocks #if you are planning on using i3blocks over i3status
                lxappearance
                papirus-icon-theme
                pcmanfm
                polybar
                rofi
                zathura
                (python3Packages.py3status.overrideAttrs (oldAttrs: { propagatedBuildInputs = [ python3Packages.pytz python3Packages.tzlocal ];
                }))
            ];
        };
    };

    services.xserver.windowManager.i3.package = pkgs.i3-gaps; 
    services.xserver.windowManager.default = "i3";
    services.xserver.displayManager.lightdm.enable = true;
    # services.xserver.displayManager.lightdm.autoLogin.enable = true;
    # services.xserver.displayManager.lightdm.autoLogin.user = "marco";



}