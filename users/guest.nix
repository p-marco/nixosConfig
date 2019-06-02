{ config, pkgs, ... }:

{

    # User section.
    users.users.guest = {
        isNormalUser = true;
        extraGroups = [ "video" ]; 
        home = "/home/guest";
        createHome = true;
        shell = pkgs.zsh;
    };
    
    fileSystems."/home/guest" =
    { 
        fsType = "tmpfs";
    };
}