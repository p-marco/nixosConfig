{ config, pkgs, ... }:

{

    # User section.
    users.users.guest = {
        isNormalUser = true;
        home = "/home/guest";
        createHome = true;
    };
    
    fileSystems."/home/guest" =
    { 
        fsType = "tmpfs";
    };
}