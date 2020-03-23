{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan :
      ../hardware/ryzen.nix
      # Include bootloader :
      ../boot/efi.nix
      # General configuration :
      ../configs/base.nix
      # Packages :
      ../packages/base.nix
      # Fonts : 
      ../fonts/base.nix
      # Users :
      ../users/casa.nix
      ../users/guest.nix
      ../users/ludmila.nix
      ../users/marco.nix
    ];

  
  boot ={
    supportedFilesystems = [ "ntfs" "fuse" ]; 
    tmpOnTmpfs = true;
  };

  networking = {
    hostName = "ryzen";
    wireless = {
      enable = false;
    };
  };

  services = {
    printing.enable = true;
    xserver = {
      desktopManager = {
        gnome3 = {
          enable = true;
        };
      };
      displayManager = {
        gdm = {
          enable = true;
        };
      };
      synaptics = {
        enable = false;
      };
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
        openbox = {
          enable = true;
        };
      };
    };
  };



  # Enable sound :
  sound.enable = true;
  
  # Enable virtualbox.
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  # Enable the Oracle Extension Pack.

  # nixpkgs.config.firefox.enableAdobe = true;

}
