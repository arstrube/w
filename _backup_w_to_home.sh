#!/bin/bash

function pause() { read -n1 -rsp$'Press any key to continue...\n'; }

# Change to the folder that this script resides in
cd "`dirname "$0"`";

# Copy files to backup drive, overwrite only if newer.
printf '\n';
printf 'B A C K I N G   U P   W - D R I V E \n';
printf '=================================== \n';
printf 'Working... \n\n';
src=`pwd`/;
dst=~/d/w-drive;
exclude=`basename $0 .sh`.txt; #or: exclude=${0%.txt}
rsync -av --exclude-from=$exclude $src $dst;
pause;
