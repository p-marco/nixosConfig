{ config, pkgs, ... }:

{

    # User section.
    users.users.guest = {
        isNormalUser = true;
        extraGroups = [ "video" ]; 
        home = "/home/guest";
        createHome = true;
    };
    
    fileSystems."/home/guest" =
    { 
        fsType = "tmpfs";
    };
}