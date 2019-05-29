{ config, pkgs, ... }:

{     
    
    nixpkgs.config.allowUnfree = true;

    # Internationalization.
    i18n = {
      consoleKeyMap = "it";
      defaultLocale = "en_US.UTF-8";
    };
  # Networking.
    networking.dhcpcd.extraConfig = "noarp";

    # Services.
    services.xserver.layout = "it,us,cz,sk";
    
    # Enable sound.
    sound.enable = true;
    
    #System.
    system.autoUpgrade.enable = true;
    system.stateVersion = "19.03"; 
    
    # Timezone.
    time.timeZone = "Europe/Prague";

}
