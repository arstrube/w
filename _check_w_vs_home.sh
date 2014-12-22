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
ex_from='_backup_w_to_home.txt';
rsync -av --dry-run --exclude '.DS_Store' --exclude '._*' --exclude '*/' --exclude-from=$ex_from $src $dst;
pause;
