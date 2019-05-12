{ config, pkgs, ... }:

{

    # User section.
    users.users.marco = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
        home = "/home/marco";
        packages = with pkgs; [
            calibre
            conky
            gimp
            home-manager
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