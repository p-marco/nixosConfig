{ config, pkgs, ... }:

{
    # environment.pathsToLink = [ "/libexec" ]; 

    services.xserver = {
        enable = true;
        

        desktopManager = {
            default = "none";
            xterm.enable = false;
        };

        windowManager.openbox = {
            enable = true;
        };
    };

    # services.xserver.windowManager.i3.package = pkgs.i3-gaps; 
    services.xserver.windowManager.default = "openbox";
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.displayManager.lightdm.autoLogin.enable = true;
    services.xserver.displayManager.lightdm.autoLogin.user = "marco";
    programs.light.enable = true;


    environment.systemPackages = with pkgs; [
        arc-theme
        betterlockscreen
        dmenu 
        dunst
        feh
        lxappearance
        numix-cursor-theme
        papirus-icon-theme
        pcmanfm
        polybar
        rofi
        zathura
    ];


}