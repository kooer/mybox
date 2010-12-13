#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
dir='/home/kooer/book/newbook/b/'
files=`ls $dir`
for v in $files
do
    _subject=`ls -lh $dir$v | grep "^-" | awk '{print " [size:"$5"]"}'`
    echo "$v $_subject"
    echo "" | mutt -s "$v $_subject" -a "$dir$v" -- shafei1900@gmail.com
done
IFS=$SAVEIFS
