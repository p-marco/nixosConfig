{ config, pkgs, ... }:

{  
    # Internationalization.
    i18n = {
      consoleFont = "Source Code Pro";
      consoleKeyMap = "it";
      defaultLocale = "en_US.UTF-8";
    };

    # Boot.
    boot.initrd.luks.devices = [
      {
        name = "root";
        device = "/dev/sda3";
        preLVM = true;
      }
    ];
    
    # Networking.
    networking.dhcpcd.extraConfig = "noarp";
    networking.wireless.enable = true;

    # Services.
    services.fstrim.enable = true;
    services.xserver.layout = "it,us,cz,sk";
    services.xserver.synaptics.enable = true;
    
    # Enable sound.
    sound.enable = true;
    
    #System.
    system.autoUpgrade.enable = true;
    system.stateVersion = "19.03"; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";

    
}