#!/bin/bash
##
src_root=/Volumes/w
dst_root=~/d/w-drive
for dir in 00_APL 01_APPLICATIONS 02_ARND_STRUBE;
do
src=$src_root/$dir; dst=$dst_root/$dir;
  printf "Backing up $src to $dst...\n\n";
  # rsync -v -a "$src_root/$dir/" "$dst_root/dir";
done
##