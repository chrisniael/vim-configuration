#!/bin/bash

set -e

HOME=~
VIM_CONFIG_DIR=.vim
PROJ_DIR=$(pwd)
VIM_CONFIG_DIR_TAR_FILE=.vim.tar.bz2

cd

if ! [ -d $VIM_CONFIG_DIR ]
then
	echo "$VIM_CONFIG_DIR not exist" 
	exit 1
fi

tar -jcf $VIM_CONFIG_DIR_TAR_FILE $VIM_CONFIG_DIR

if [ $? -ne 0 ]
then
	echo "tar -jcf $VIM_CONFIG_DIR_TAR_FILE $VIM_CONFIG_DIR fail"
	exit 1
fi

mv -f $VIM_CONFIG_DIR_TAR_FILE $PROJ_DIR/

if [ $? -ne 0 ]
then
	echo "mv -f $VIM_CONFIG_DIR_TAR_FILE $PROJ_DIR/ fail"
	exit 1
fi

echo "success"
