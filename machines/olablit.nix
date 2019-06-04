{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan :
      ../hardware/olablit.nix
      # Include bootloader :
      ../boot/efi.nix
      # General configuration :
      ../configs/base.nix
      # Packages :
      ../packages/base.nix
      # Fonts : 
      ../fonts/base.nix
      # Users :
      ../users/guest.nix
      ../users/marco.nix
    ];

  
  boot ={
    supportedFilesystems = [ "ntfs" "fuse" ]; 
    tmpOnTmpfs = true;
  };

  networking = {
    hostName = "olablit";
    wireless = {
      enable = false;
    };
  };

  services = {
    xserver = {
      desktopManager = {
        gnome3 = {
          enable = false;
        };
      };
      displayManager = {
        lightdm = {
          enable = true;
          autoLogin = {
            enable = true;
            user = "marco";
          };
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
          enable = false;
        };
      };
    };
  };


  # Enable sound :
  sound.enable = true;
  


}
