#!/bin/bash
c_dir=$(pwd)
w_dir=($(pwd)"/work_dir")
r_dir=($(pwd)"/fastboi_checker")
l_file=($(pwd)"/latest_log.txt")

if [ $EUID != 0 ]; then
    echo "$EUID:$(whoami) is not root!"
    exit $?
else
    mkarchiso -v -w $w_dir $r_dir >> $l_file
    echo
    if [ -d $w_dir ]; then
        rm -r $w_dir
        echo "Temporary directory successfully removed"
    else
        echo "Removing the temporary directory failed"
    fi
fi


