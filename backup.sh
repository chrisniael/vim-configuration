#!/bin/bash
# +---------------------------------+
# | @file backup.sh                |
# | @author 沈煜, shenyu@shenyu.me  |
# | @brief 一键备份vim插件和配置    |
# | @date 2015/08/02                |
# +---------------------------------+


set -e

HOME=~
VIM_CONFIG_DIR=.vim
PROJ_DIR=$(pwd)
VIM_CONFIG_FILE=.vimrc

if ! [ -d $HOME/$VIM_CONFIG_DIR ]
then
	echo "$HOME/$VIM_CONFIG_DIR not exist." 
	exit 1
fi

rm -rf $PROJ_DIR/$VIM_CONFIG_DIR
cp -r $HOME/$VIM_CONFIG_DIR $PROJ_DIR

cp -f $HOME/$VIM_CONFIG_FILE $PROJ_DIR/

echo "success."
