# nixosConfig

## Introduction

Personal configs for different machines.
They have to be compiled symlinking the target machine nix file as default configuration. 
Due to the fact that `/etc/nixos` resides on a git repo, is possible to rollback, as well to have the same configuration on the machines.

## Installation procedure

Boot the Nixos iso, and you will be prompted as root.

The first step is to **prepare the disks** for the installation (see below). Mount the filesystems at the relevant mountpoints (/mnt, /boot, /home and swap). 
Then, make a configuration:

    # nixos-generate-config --root /mnt

Now, the directory `/etc/nixos` is created in the host system. Copy the file `/etc/nixos/hardware-configuration.nix` in a different place and remove the generated directory. **Remember** that in this stage we need to address the host path prepending `/mnt`: 

    # cp /mnt/etc/nixos/hardware-configuration.nix ~./
    # rm -f /etc/nixos

Install git:

    # nix-env -iA nixos.pkgs.git

and clone the repository in the folder:

    # git clone https://github.com/p-marco/nixosConfig /mnt/etc/nixos

Move `hardware-configuration.nix` into the nixos folder.

Target the relevant profile in `./machines` and select it by symlinking to `nixos/configuration.nix` (e.g. here the machine is "vm"):

    # unlink /mnt/etc/nixos/configuration.nix
    # ln -s /mnt/etc/nixos/machines/vm.nix /mnt/etc/nixos/configuration.nix

Then the installation can be now started via:
    
    # nixos-install

And then is possible to reboot the system and it will be fully functional.

## Partitioning

### Partition scheme

#### GPT/BIOS (requires GRUB on sda)

    DEVICE      MOUNTPOINT          FILESYSTEM      CODE
    ----------------------------------------------------
    sda1        boot (no MOUNT)     nofs            ef02
    sda2        /boot               ext4            8300
    sda3                                            8e00
        root    /                   ext4
        swap                        swap
        home    /home               ext4

#### GPT/UEFI

    DEVICE      MOUNTPOINT          FILESYSTEM      CODE
    ----------------------------------------------------
    sda1        /boot               efi             ef00
    sda3                                            8e00
        root    /                   ext4
        swap                        swap
        home    /home               ext4

Sda3 is an encrypted LVM (I am copying from the useful post at https://qfpl.io/posts/installing-nixos/).

### Gdisk

Make sure about the device via `lsblk`.Then run (`/dev/sda` needs to be edit accordingly). I use `/dev/sda3` for all the configurations (efi and bios, in order to have a similar behaviour):
    
    # gdisk /dev/sda 

#### EFI    
    -- Create the EFI boot partition
    Command: n
    Partition number: 1
    First sector: <enter for default>
    Last sector: +1G       --  make a 1 gigabyte partition
    Hex code or GUID: ef00 -- this is the EFI System type
    -- Create the LVM partition
    Command: n
    Partition number: 3
    First sector: <enter for default>
    Last sector: <enter for default - rest of disk>
    Hex code or GUID: 8e00 -- Linux LVM type
    -- Write changes and quit
    Command: w

#### BIOS

    -- Create the BIOS partition
    Command: n
    Partition number: 1
    First sector: <enter for default>
    Last sector: +12M       --  make a 12 megabyte partition
    Hex code or GUID: ef02  -- this is the EFI System type
    -- Create the boot partition
    Command: n
    Partition number: 2
    First sector: <enter for default>
    Last sector: +512M      --  make a 512 megabyte partition
    Hex code or GUID: 8300  -- this is the EFI System type
    -- Create the LVM partition
    Command: n
    Partition number: 3
    First sector: <enter for default>
    Last sector: <enter for default - rest of disk>
    Hex code or GUID: 8e00 -- Linux LVM type
    -- Write changes and quit
    Command: w

### Setting LUKS

    -- Setting up passcode and give a name (lvm-enc)
    # cryptsetup luksFormat /dev/sda3
    # cryptsetup luksOpen /dev/sda3 lvm-enc

    -- Create the container (lvm-vg)
    # pvcreate /dev/mapper/lvm-enc 
    # vgcreate lvm-vg /dev/mapper/lvm-enc

    -- Create volumes in lvm-vg
    # lvcreate -L 65G -n root lvm-vg
    # lvcreate -L 16G -n swap lvm-vg
    # lvcreate -l 100%FREE -n home lvm-vg

### Create filesystems

I am going to use `ext4` for the most:

    # mkfs.ext4 -L root /dev/lvm-vg/root
    # mkfs.ext4 -L home /dev/lvm-vg/home

Then, if BIOS:

    # mkfs.ext4 -L boot /dev/sda2 # ONLY BIOS

Otherwise, `/dev/sda2` doesn't exist. For EFI systems, VFAT is required for boot:

    # mkfs.vfat -n boot /dev/sda1 # ONLY UEFI

Then make and activate the swap:

    # mkswap -L swap /dev/lvm-vg/swap
    # swapon /dev/lvm-vg/swap

### Mount the filesystems

Now we can mount the filesystems:

    # mount /dev/lvm-vg/root /mnt
    # mkdir /mnt/boot
    # mkdir /mnt/home
    # mount /dev/lvm-vg/home /mnt/home

For EFI:

    # mount /dev/sda1 /mnt/boot

FOR BIOS:

    # mount /dev/sda2 /mnt/boot

Now is possible to follow the installation procedure.