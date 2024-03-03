# Bash Scripts
#### #/bin/bash
Practicing & storing Bash script(s) that I wrote or used.

## Script: VirtualBox-start-vm.sh
   - This script runs under an alias
   - When I type the alias in my terminal, this script 
        - Checks if the VM is running 
        - If it's running, connect to the VM using SSH
        - If it's not running, turn the VM on
        - Wait for specified seconds for the VM to start
        - Then connect to the VM using SSH

## Script: KVM-virsh-start-vm.sh
   - This script runs under an alias
   - When I type the alias in my terminal, this script 
        - Checks if the VM is running 
        - If it's running, connect to the VM using SSH
        - If it's not running, turn the VM on
        - Wait for specified seconds for the VM to start
        - Then connect to the VM using SSH
   - This script can be modified for remote hypervisor

## Script: firefox-profile-backup.sh
   - Backs up my Firefox profiles in two different locations. 
   - In the first location, keep the Firefox profiles as it is.
   - In the second location, archives the Firefox profiles in bgiz2 to reduce the side.
   - This script can be modified for remote locations.

## Script: delete-more-than.sh
   - This script runs as a cron job.
   - This script checks the specified folder for several files (Here 5) with the specified extensions.
   - If the file numbers are more than the specified number, it deletes the oldest file.
