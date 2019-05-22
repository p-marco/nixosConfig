{ config, pkgs, ... }:

{
  imports =
    [   # Include the results of the hardware scan.
        ../hardware-configuration.nix
        # Include base config
        ../configs/base.nix 
        # Include packages for root
        # ../packages/base.nix
        # Include fonts
        ../fonts/base.nix
        # Include users
        ../users/base.nix
        # ../users/guest.nix
        # Include Bootloader
        ../boot/grub.nix
        # Include Desktop
        # ../desktops/i3.nix
        ../desktops/openbox.nix
        # ../desktops/compton.nix
        # Include Kernel
        ../kernels/linux-hardened.nix
    ];


  # Networking.
  networking.hostName = "aspire32"; 
  networking.wireless.enable = true;
  services.xserver.synaptics.enable = true;
  programs.light.enable = true;

  # nixpkgs.config.stdenv.userHook = '' NIX_CFLAGS_COMPILE+=" -march=native -O2" '';

  # Minimal install.
  environment.systemPackages = with pkgs; [
    ark
    clipmenu
    # firefox
    git
    go
    gparted
    htop
    imagemagick
    inxi
    lm_sensors
    mupdf
    neofetch
    ntfs3g
    pandoc
    ranger
    rxvt_unicode
    smartmontools
    sublime
    vscode
    wget
    youtube-dl
  ];

  nixpkgs.config = {
    allowUnsupportedSystem = true;
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3Support = true;
      };
    };
  };
}


