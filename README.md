# nixosConfig


Different configs for different machines.

They have to be compiled symlinking the target machine nix file as default configuration. Eg (as root):

    # ln -s /etc/nixos/machines/vm/config.nix /etc/nixos/configuration.nix
    # nixos-rebuild switch -p prova

Then, the symlink needs to be unlinked:
    
    # unlink /etc/nixos/configuration.nix

