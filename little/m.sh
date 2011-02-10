#!/bin/bash

MAIL_TO="shafei1900@gmail.com"
MAX_SIZE=$((512 * 1024))

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
dir='/home/kooer/book2/lite/'
files=`ls $dir`

echo "==== CONFIG ===="
echo "mail to: $MAIL_TO"
echo "max size of each file: $MAX_SIZE"
echo "search directory: $dir"
echo ""

for v in $files
do
    # Ignore directory
    if [ ! -f $dir/$v ]; then
      continue
    fi

    _size=`ls -l $dir/$v |  awk '{print $5}'`

    if [ $_size -gt $MAX_SIZE ]; then

      # Zip large file, and send them, then delete
      /usr/bin/zip -s $MAX_SIZE _temp_ $dir/$v > /dev/null

      for vv in `ls _temp_*`
      do
        # Send mail
        _subject=`ls -lh $vv | awk '{print " [size:"$5"]"}'`
        echo "$v $_subject ($vv)"
        echo "" | mutt -s "$v $_subject ($vv)" -a "$vv" -- $MAIL_TO
      done

      rm -f _temp_*

    else
      # Send mail
      _subject=`ls -lh $dir/$v | awk '{print " [size:"$5"]"}'`
      echo "$v $_subject"
      echo "" | mutt -s "$v $_subject" -a "$dir$v" -- $MAIL_TO
    fi

done
IFS=$SAVEIFS
