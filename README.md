# ArchScripts
My minimal installation scripts for Arch Linux.

These scripts are currently all experimental. Theming and features are a work-in-progress.

**`Warning: These scripts target /dev/sda. Check with lsblk or fdisk -l before you run the script. If incompatable, clone or fork the repository and change these values in your chosen script's files. Make sure that you check the storage requirements before installing.`**

## plasma.sh (Plasma Desktop with Pipewire Audio, Nvidia, and additional packages)
Recommended storage (minumum) provided for installation: **`> 16 GB`**

Minimum storage required for installation (not recommended): `~ 8.3 GB`


# Using a script
Check that your main storage device is `/dev/sda`: Execute `lsblk` **or** `fdisk -l`

Start the installation: `bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/REPLACEWITHSCRIPTNAME.sh)`
### Examples
Plasma desktop, nvidia & pipewire audio, etc: `bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/plasma.sh)`

Budgie desktop, nvidia & pipewire audio, etc: `bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/budgie.sh)`

UEFI VMs: `bash <(curl https://raw.githubusercontent.com/nsgwick/ArchScripts/main/vm_uefi.sh)`

##

ftr i don't like te lag in plasma
