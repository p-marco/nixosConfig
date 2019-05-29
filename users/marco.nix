{ config, pkgs, ... }:

{

    # User section.
    users.users.marco = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" "video" ]; 
        home = "/home/marco";
        createHome = true;
    };

      fileSystems."/home/marco/Downloads" =
    { 
        fsType = "tmpfs";
    };
}