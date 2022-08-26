#!/bin/bash

# Might require sudo
# VM-Name = VM Name from "vboxmanage list runningvms" command

VMUUID=VM-UUID
VMName=VM-Name

function StartingVM () {
echo "Starting VM-Name" 
vboxmanage startvm {$VMUUID} --type=headless
}

function CountDown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%S)\r \c";
     sleep 0.1
   done
} # Not my Function. Copied from somewhere

function SSH (){
  echo "Connecting with SSH ..."
  ssh -i LocationToPrivateKey UserName@IP
}

function BootCheck () {
if ping -c 1 IP/HostName &> /dev/null
then
  SSH
else
  echo "Host is not UP"
  echo "Trying again in ..."
  CountDown 15
  SSH
  echo "Host is Down"
  echo "Exiting ..."
fi
}

echo "Checking VM Status ..."

if virsh list --state-running | grep -q "$VMUUID""; then
   echo "VM $VMUUID is running"
   SSH
else
   echo "VM $VMUUID is not running"
   StartingVM
   echo "Waiting for VM to boot ..."
   CountDown 20
   BootCheck
fi
