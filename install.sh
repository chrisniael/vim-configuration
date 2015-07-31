#!/bin/bash
# @file install.sh
# @author 沈煜, shenyu@shenyu.me
# @brief 一键部署vim插件和配置
# @date 2015/07/31


HOME_DIR=~
VIM_CONFIG_REPO=https://github.com/chrisniael/vim-configuration.git
VIM_CONFIG_LOCAL_REPO=$HOME_DIR/vim-configuration
VIM_CONFIG_FILE=.vimrc
VIM_CONFIG_DIR=.vim
SEP_STRING="filetype plugin indent on"
VUNDLE_REPO=https://github.com/gmarik/Vundle.vim.git
VUNDLE_LOCAL_REPO=$HOME_DIR/.vim/bundle/Vundle.vim
SUPERTAB_DIR=$HOME_DIR/.vim/bundle/supertab
VIM_LOCAL_CONFIG_FILE=$HOME_DIR/$VIM_CONFIG_FILE
VIM_LOCAL_CONFIG_FILE_BACK=$VIM_LOCAL_CONFIG_FILE-backup
VIM_LOCAL_CONFIG_DIR=$HOME_DIR/$VIM_CONFIG_DIR
VIM_LOCAL_CONFIG_DIR_BACK=$VIM_LOCAL_CONFIG_DIR-backup


# 备份原配置
if [ -f $VIM_LOCAL_CONFIG_FILE ]
then
	/bin/mv -f $VIM_LOCAL_CONFIG_FILE $VIM_LOCAL_CONFIG_FILE_BACK
	echo "备份 $VIM_LOCAL_CONFIG_FILE 至 $VIM_LOCAL_CONFIG_FILE_BACK"
fi

if [ -d $VIM_LOCAL_CONFIG_DIR ]
then
	if [ -d $VIM_LOCAL_CONFIG_DIR_BACK ]
	then
		/bin/rm -rf $VIM_LOCAL_CONFIG_DIR_BACK
	fi

	/bin/mv -f $VIM_LOCAL_CONFIG_DIR $VIM_LOCAL_CONFIG_DIR_BACK
	echo "备份 $VIM_LOCAL_CONFIG_DIR 至 $VIM_LOCAL_CONFIG_DIR_BACK"
fi

# 安装Vundle
git clone $VUNDLE_REPO $VUNDLE_LOCAL_REPO 

# clone vim-configuration仓库
git clone $VIM_CONFIG_REPO $VIM_CONFIG_LOCAL_REPO

# 查找插件列表与配置的分割行
cd $VIM_CONFIG_LOCAL_REPO
sep_line=$(sed -n "/^${SEP_STRING}/=" $VIM_CONFIG_FILE)

# 写入Vundle插件列表
sed -n "1,${sep_line}p" $VIM_CONFIG_FILE > $VIM_LOCAL_CONFIG_FILE

/bin/cp -rf $VIM_CONFIG_LOCAL_REPO/$VIM_CONFIG_DIR $HOME_DIR/$VIM_CONFIG_DIR

# 安装所有插件
vim +BundleInstall +qa

# 检出SuperTab 2.0版本，最新的2.1版本有有不兼容问题
cd $SUPERTAB_DIR
git checkout 2.0

# 写入其他配置
cd $VIM_CONFIG_LOCAL_REPO
sep_next_line=$((${sep_line}+1))
sed -n "${sep_next_line},\$p" $VIM_CONFIG_FILE >> $VIM_LOCAL_CONFIG_FILE


/bin/rm -rf $VIM_CONFIG_LOCAL_REPO
