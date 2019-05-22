{ config, lib, pkgs, ... }:

{
  

  fileSystems."/media/Elements" =
    { device = "/dev/disk/by-uuid/4E1AEA7B1AEA6007";    
      fsType = "ntfs";
      options = ["user" "rw" "noauto"];
    };
  
}
