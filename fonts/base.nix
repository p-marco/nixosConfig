{ config, pkgs, ... }:

{
    fonts = {
        enableFontDir = true;
        enableGhostscriptFonts = true;
        fonts = with pkgs; [
            anonymousPro
            corefonts
            dejavu_fonts
            fira-code
            fira-code-symbols
            font-awesome_5
            freefont_ttf
            google-fonts
            inconsolata
            liberation_ttf
            material-icons
            powerline-fonts
            source-code-pro
            terminus_font
            ttf_bitstream_vera
            ubuntu_font_family
        ];
        fontconfig = {
            penultimate.enable = false;
            defaultFonts = {
                monospace = [ "Source Code Pro" ];
                sansSerif = [ "Quicksand Medium" ];
                serif     = [ "Source Serif Pro" ];
            };
        };
    };
}