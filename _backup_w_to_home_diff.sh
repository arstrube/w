#!/bin/bash

function pause() { read -n1 -rsp$'Press any key to continue...\n'; }

# Change to the folder that this script resides in
cd "`dirname "$0"`";

# Copy files not in w-drive to w-drive-diff, overwrite only if newer
printf '\n';
printf 'B A C K I N G   U P   D I F F   O F   W - D R I V E \n';
printf '=================================================== \n';
printf 'Working... \n\n';
src=`pwd`/;
dst=~/d/w-drive-diff;
exclude=~/d/usr/tmp/`basename $0 _diff.sh`.txt;
bak=~/d/w-drive;
find $bak -type f | sed "s:$bak/::" > $exclude; # or: tree -if --noreport $bak/
rsync -av --exclude='.*' --exclude=__W-TEMP --exclude-from=$exclude $src $dst;
pause;
