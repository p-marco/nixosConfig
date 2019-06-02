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

  programs.zsh = {
    enable = true;
    shellAliases = {
      vim = "nvim";
    };
    enableCompletion = true;
    enableAutosuggestions = true;
    interactiveShellInit = ''
      # z - jump around
      source ${pkgs.fetchurl {url = "https://github.com/rupa/z/raw/2ebe419ae18316c5597dd5fb84b5d8595ff1dde9/z.sh"; sha256 = "0ywpgk3ksjq7g30bqbhl9znz3jh6jfg8lxnbdbaiipzgsy41vi10";}}
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
      export ZSH_THEME="agnoster"
      plugins=(git)
      source $ZSH/oh-my-zsh.sh
    '';
    promptInit = "";
  };

  # Enable sound :
  sound.enable = true;
  


}
