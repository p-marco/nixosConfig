# This is a common configuration. Refer to host-specific hardware scan for fallback.

{ config, lib, pkgs, ... }:

{
  # imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "sd_mod" "sr_mod" ];
  # boot.kernelModules = [ ];
  # boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-label/home";
      fsType = "ext4";
    };
  
  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];


}
