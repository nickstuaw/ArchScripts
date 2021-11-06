# ArchScripts
My installation scripts for Arch Linux.

Warning: these scripts obviously may not work on your machine due to device names, storage requirements, etc.

Theming and features are a W.I.P.

**`Warning: These scripts target /dev/sda. Check with lsblk or fdisk -l before you run the script. If incompatable, clone or fork the repository and change these values in your chosen script's files.`**

## plasma.sh (Plasma Desktop with Pipewire Audio, Nvidia, and additional packages)
Recommended storage (minumum) provided for installation: **`> 16 GB`**

Minimum storage required for installation (not recommended): `~ 8.3 GB`


# Using a script
Just run: `bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/REPLACEWITHSCRIPTNAME.sh)`
### Examples
Budgie desktop & pipewire audio, etc: `bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/budgie.sh)`

UEFI VMs: `bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/vm_uefi.sh)`

##

ftr i don't like te lag in plasma
