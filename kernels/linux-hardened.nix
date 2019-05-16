{ config, pkgs, ... }:

{ 
    # Kernel 
    boot.kernelPackages = pkgs.linuxPackages_hardened;
    boot.supportedFilesystems = [ "ntfs" "fuse" ];

    security.hideProcessInformation = true;
    security.lockKernelModules = true;
    security.allowUserNamespaces = true;
    security.protectKernelImage = true;
    security.allowSimultaneousMultithreading = false;
    security.virtualization.flushL1DataCache = "always";
    security.apparmor.enable = true; 
}