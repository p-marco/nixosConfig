services.xserver.windowManager.i3.package =pkgs.i3-gaps; 

services.xserver.windowManager.default = "i3";
services.xserver.displayManager.lightdm.enable =true;
services.xserver.displayManager.lightdm.autoLoginenable = true;
services.xserver.displayManager.lightdm.autoLoginuser = "marco";
