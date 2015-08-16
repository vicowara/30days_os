#!/bin/bash

if [ $# -ne 1 ]; then
    echo "invalid argument"
    exit 1
fi

if [ ! -e $1 ]; then
    echo "$1: no such a file"
    exit 1
fi

workfile=`basename $1 .nas`.s

if [ -e $workfile ]; then
    echo "$workfile has existed. overwrite?[y/n]"
    while true;do
	
	read answer
	case $answer in
	    y)
		echo "OK. overwrite it."
		break
		;;
	    n)
		echo "abort."
		exit 1
		;;
	    *)
		echo "input y or n"
		;;
	esac
    done
fi

cp $1 $workfile
nkf -Lu -w --overwrite $workfile

sed -i -e '1i .code16' $workfile
sed -i -e '2i .text' $workfile
sed -i 's/;/#/g' $workfile
sed -i '/"/s/DB/.ascii/g' $workfile
sed -i '/^"/!s/DB/.byte/g' $workfile
sed -i 's/DW/.word/g' $workfile
sed -i -E 's/^([ \t]*)DD/\1.int/g' $workfile
sed -i 's/JMP/jmp/g' $workfile
sed -i 's/JE/je/g' $workfile
sed -i 's/HLT/hlt/g' $workfile
sed -i -E 's/INT([ \t]*)([0-9a-fx]*)/int\1$\2/g' $workfile
sed -i -E 's/RESB(\t*)([0-9a-z$-]*)/.skip\1\2, 0x00/g' $workfile
