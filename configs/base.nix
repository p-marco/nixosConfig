{ config, pkgs, ... }:

{  
    # Internationalization.
    i18n = {
      consoleFont = "Lat2-Terminus16";
      consoleKeyMap = "it";
      defaultLocale = "en_US.UTF-8";
    };

    # Boot.
    boot.tmpOnTmpfs = true;

    # Services.
    services.fstrim.enable = true;
    
    # Enable sound.
    sound.enable = true;
    
    #System.
    system.autoUpgrade.enable = true;
    system.stateVersion = "19.03"; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";
}