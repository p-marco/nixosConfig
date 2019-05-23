# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "sd_mod" "sr_mod" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/4653551c-8aa1-4068-ad4f-3f13ad489c79";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/fffa5431-681c-435c-a931-4ee02461d0cc";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/d60bc93c-0998-4fdf-bc71-3b78575be408";
      fsType = "ext4";
    };
  
  swapDevices =
    [ { device = "/dev/disk/by-uuid/5a136c45-063d-4d35-b212-718ac10079ae"; }
    ];

  nix.maxJobs = lib.mkDefault 2;
  virtualisation.virtualbox.guest.enable = true;
}