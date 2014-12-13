#!/bin/bash

function pause() { read -n1 -rsp$'Press any key to continue...\n'; }

# Change to the folder that this script resides in
cd "`dirname "$0"`";

# Copy files to backup drive, overwrite only if newer.
printf '\n';
printf 'C H E C K I N G   W :   V S   H O M E \n';
printf '===================================== \n';
printf 'Working... \n\n';
src=~/d/w-drive/;
dst=`pwd`;
exclude='_backup_w_to_home.txt';
rsync -av --dry-run --exclude-from=$exclude $src $dst;
pause;
