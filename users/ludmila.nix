{ config, pkgs, ... }:

{

    # User section.
    users.users.ludmila = {
        isNormalUser = true;
        extraGroups = [ "video" ]; 
        home = "/home/ludmila";
        createHome = true;
        shell = pkgs.zsh;
    };

      fileSystems."/home/ludmila/Downloads" =
    { 
        fsType = "tmpfs";
    };
}