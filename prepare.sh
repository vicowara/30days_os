#!/bin/bash

PROJECTS_PATH="$HOME/Scripts/30days_os/30days_os/projects"
Z_TOOLS_PATH="$PWD/z_tools"

if [ $# -ne 1 ]; then
	echo "invalid argument"
	exit 1
fi

if [ -e $1 ]; then
	echo "$1 has existed."
	exit 1
fi

if [ ! -e $PROJECTS_PATH/$1_day ]; then
	echo "$PROJECTS_PATH/$1_day doesn't exist."
	exit 1
fi

if [ ! -e $Z_TOOLS_PATH ]; then
	echo "$Z_TOOLS_PATH doesn't exist."
	exit 1
fi

mkdir $1
cd $1
cp -r $PROJECTS_PATH/$1_day/* .
cp -r $Z_TOOLS_PATH .
for i in `ls`
do
	if [ $i != "z_tools" ] && [ -d $i ]; then
		cd $i
		../z_tools/apply-patch.sh
		cd ..
	fi
done
