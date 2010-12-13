#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
dir='/home/kooer/book/newbook/'
files=`ls $dir`
for v in $files
do
    echo $v
    echo "" | mutt -s "$v" -a "$dir$v" -- shafei1900@gmail.com
done
IFS=$SAVEIFS
