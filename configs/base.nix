{ config, pkgs, ... }:

{  
    # Internationalization.
    i18n = {
      consoleFont = "Source Code Pro";
      consoleKeyMap = "it";
      defaultLocale = "en_US.UTF-8";
    };

    # Boot.
    boot.tmpOnTmpfs = true;
    networking.dhcpcd.extraConfig = "noarp";

    # Services.
    services.fstrim.enable = true;
    services.xserver.layout = "it";
    
    # Enable sound.
    sound.enable = true;
    
    #System.
    system.autoUpgrade.enable = true;
    system.stateVersion = "19.03"; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";
    
}