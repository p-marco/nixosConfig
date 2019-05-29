{ config, pkgs, ... }:

{

    # User section.
    users.users.ludmila = {
        isNormalUser = true;
        extraGroups = [ "video" ]; 
        home = "/home/ludmila";
        createHome = true;
    };

      fileSystems."/home/ludmila/Downloads" =
    { 
        fsType = "tmpfs";
    };
}