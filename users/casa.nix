{ config, pkgs, ... }:

{

    # User section.
    users.users.casa = {
        isNormalUser = true;
        extraGroups = [ "video" ]; 
        home = "/home/casa";
        createHome = true;
        shell = pkgs.zsh;
    };

}