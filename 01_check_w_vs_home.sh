#!/bin/bash

function pause() { read -n1 -rsp$'Press any key to continue...\n'; }

# Change to the folder that this script resides in
cd "`dirname "$0"`";

# Copy files to backup drive, overwrite only if newer.
printf '\n';
printf 'C H E C K I N G   W :   V S   H O M E \n';
printf '===================================== \n';
printf 'Working... \n\n';
src=~/d/dat/w-drive/;
dst=`pwd`;
exclude='01_backup_w_to_home.txt';
rsync -a --dry-run --exclude-from=$exclude $src $dst;
pause;
