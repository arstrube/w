#!/bin/bash

function pause()
{
    read -n1 -r -p"Press any key to continue..." key;
    printf "\n";
}

# Copy files not contained in w-drive to backup drive,
# e.g. w-drive-diff. Overwrite only if newer.
printf '\n';
printf 'B A C K I N G   U P   D I F F   O F   W - D R I V E \n';
printf '=================================================== \n';
printf 'Working... \n\n';

# Change to the folder that this script resides in
cd "`dirname "$0"`";

# Write files already in w-drive into temporary exclude file
basename=`basename $0 .sh`;
exclude=~/d/usr/tmp/$basename.txt;
bak=~/d/dat/w-drive;
find $bak/ -type f | sed "s:$bak::" > $exclude; # or: tree -if --noreport $bak/

# Run the differential backup
src=`pwd`/;
dst=~/d/dat/w-drive-diff;
rsync -av --exclude='.*' --exclude-from=$exclude $src $dst;

pause;
























