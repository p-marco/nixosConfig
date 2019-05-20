{ config, pkgs, ... }:

{

    # User section.
    users.users.marco = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" "video" ]; # Enable ‘sudo’ for the user.
        home = "/home/marco";
        packages = with pkgs; [
            calibre
            conky
            gimp
            home-manager
            imagemagick
            inkscape
            libreoffice
            mupdf
            pandoc
            ranger
            rxvt_unicode
            sublime
            vscode
            youtube-dl
        ];
    };
}