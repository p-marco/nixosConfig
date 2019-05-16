{ config, pkgs, ... }:

{
    services.compton = {
        enable = true;
        backend = "glx";
        vSync = "opengl-swc";
        extraOptions = ''
            paint-on-overlay = true;
            blur-background   = true;
            shadow = true;
            no-dnd-shadow = true;
            no-dock-shadow = true;
            clear-shadow = true;
            shadow-radius = 10;
            shadow-offset-x = -10;
            shadow-offset-y = -10;
            shadow-exclude = [
	            "class_g = 'conky'",
	            "class_g = 'Conky'"
            ];
        '';
    };
}