{ config, pkgs, ... }:

{     
    
    # Boot.
    boot.initrd.luks.devices = [
      {
        name = "root";
        device = "/dev/sda3";
        preLVM = true;
      }
    ];

    # Internationalization.
    i18n = {
      consoleFont = "Source Code Pro";
      consoleKeyMap = "it";
      defaultLocale = "en_US.UTF-8";
    };
    
    # Networking.
    networking.dhcpcd.extraConfig = "noarp";

    # Services.
    services = {
      fstrim = {
        enable = true;
      };
      xserver = {
        enable = true;
        xkbOptions = "eurosign:e";
        layout = "it,us,cz,sk";
      };
    };
    
    #System.
    system = {
      autoUpgrade = {
        enable = true;
      };
      stateVersion = "19.03";
    }; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";




    # services.fstrim.enable = true;
    # 
    # services.xserver.enable = true;
    # services.xserver.xkbOptions = "eurosign:e";
    # services.xserver.layout = "it,us,cz,sk";

}
