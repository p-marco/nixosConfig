# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1dc66f70-f88d-4dd5-afe8-3b99982012a2";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5979-FBCD";
      fsType = "vfat";
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/455bc6d6-dfd0-4728-aa93-e39156a26fbe";
      fsType = "ext4";
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/0a0600cd-86a3-445a-bba4-72994db63dcb";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/55ece239-9368-48c8-b004-dceae4d96238";
      fsType = "ext4";
    };

  fileSystems."/private/home" =
    { device = "/dev/disk/by-uuid/0702ad17-4c9b-44f0-b5f5-05408f441611";
      fsType = "ext4";
      options = ["user" "rw" "nofail"];
    };

  fileSystems."/private/data" =
    { device = "/dev/disk/by-uuid/4598e5e0-4942-40fd-80ff-b8dbcc93f51a";
      fsType = "ext4";
      options = ["user" "rw" "nofail"];
    };

  fileSystems."/backup/data" =
    { device = "/dev/disk/by-uuid/2ac52817-90ae-4526-b1cf-53019eb7d69f";
      fsType = "ext4";
      options = ["user" "rw" "nofail"];
    };

  fileSystems."/backup/var" =
    { device = "/dev/disk/by-uuid/5b1430f6-c753-4ebc-8c44-98348e2f5db2";
      fsType = "ext4";
      options = ["user" "rw" "nofail"];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/facfe3bb-ba1a-4ce1-9045-b1a163eb3554"; }
    ];

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}