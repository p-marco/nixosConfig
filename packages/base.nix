{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        busybox
        clipmenu
        firefox 
        git 
        go
        gparted
        home-manager
        htop 
        imagemagick
        inxi
        libreoffice
        light
        lm_sensors
        mupdf
        neofetch 
        ntfs3g
        oh-my-zsh
        ranger
        rclone 
        rsync 
        smartmontools
        wget
        youtube-dl
        zsh
    ];

    nixpkgs.config.allowUnfree = true;
    programs.light.enable = true;

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
}

