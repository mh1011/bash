#!/bin/bash

function Starting_VM () {
echo "Starting VM-Name" 
vboxmanage startvm {VM-UUID} --type=headless
}

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%S)\r \c";
     sleep 0.1
   done
}

function SSH (){
  echo "Connecting with SSH ..."
  ssh -i LocationToPrivateKey UserName@IP
}

function Boot_Check () {
if ping -c 1 IP/HostName &> /dev/null
then
  SSH
else
  echo "Host is not UP"
  echo "Trying again in ..."
  countdown 15
  SSH
  echo "Host is Down"
  echo "Exiting ..."
fi
}

echo "Checking VM Status ..."

if vboxmanage list runningvms | grep -q {VM-UUID}; then
   echo 'VM is running'
   SSH
else
   echo 'VM is not running'
   Starting_VM
   echo "Waiting for VM to boot ..."
   countdown 20
   Boot_Check
fi
