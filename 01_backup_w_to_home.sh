#!/bin/bash

function pause()
{
    read -n1 -r -p "Press any key to continue..." key;
    printf "\n";
}

function do_copy()
{
    dst=$root/$1;
    src=$cdrv/$1;
    printf "Backing up $src to $dst...\n";
    rsync -av --exclude-from=$exclude $src $dst
}

# Copy files to backup drive, overwrite only if newer.
printf '\n';
printf 'B A C K I N G   U P   W - D R I V E \n'
printf '=================================== \n'
printf 'Working... \n'
cdrv=`pwd`
root=~/d/dat/w-drive
exclude=`basename $0 .sh`.txt  # or like ${0%.txt}
for dir in `ls -d */`;
do
    do_copy $dir;
done
# printf "Backing up $src to $dst ...\n\n";
# do_copy

pause;

