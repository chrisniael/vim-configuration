#!/bin/bash
# @file install.sh
# @author 沈煜, shenyu@shenyu.me
# @brief 一键备份vim插件和配置
# @date 2015/08/02


set -e

HOME=~
VIM_CONFIG_DIR=.vim
PROJ_DIR=$(pwd)
VIM_CONFIG_DIR_TAR_FILE=.vim.tar.bz2
VIM_CONFIG_FILE=.vimrc

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

cp -f $VIM_CONFIG_FILE $PROJ_DIR/

if [ $? -ne 0 ]
then
	echo "$cp -f $VIM_CONFIG_FILE $PROJ_DIR/ fail"
fi

echo "success"
