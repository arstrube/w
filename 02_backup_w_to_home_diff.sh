#!/bin/bash

function pause()
{
    read -n1 -r -p "Press any key to continue..." key;
    printf "\n";
}

function do_diff ()
{
#    set target=!root!\W-DRIVE%~np1
#    set source=!cdrv!%~np1
#    rem echo.&echo Diff "!source!"
#    xcopy "!source!" "!target!" /r /i %2 /h /u /y /l >C:\TEMP\%~n0.txt
    exit;
}

function do_copy()
{
#    set target=!root!\W-DRIVE-DIFF%~np1
#    set source=!cdrv!%~np1
#    echo "!source!" to "!target!"
#    xcopy "!source!" "!target!" /r /i %2 /h /d /y /exclude:C:\TEMP\%~n0.txt
    exit;
}


# Copy files to backup drive, overwrite only if newer.
# Copy target is w-drive-diff.
# Copy only files not contained in W-DRIVE.
printf '\n';
printf 'B A C K I N G   U P   D I F F   O F   W - D R I V E \n';
printf '=================================================== \n';
printf 'Working... \n\n';
# Change to the folder that this script resides in
cd "`dirname "$0"`";
# Setup variables
basename=`basename $0 _diff.sh`;
src=`pwd`;
dst=~/d/dat/w-drive-diff;
include=~/d/usr/tmp/$basename.txt
exclude=$basename.txt;
echo excluding from: $exclude;
echo Including from: $include;
cmd="rsync -v --dry-run --exclude=* --include-from=$exclude $src $dst"
echo "$cmd";
$cmd;
pause;
























