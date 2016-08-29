#!/bin/bash
# +---------------------------------+
# | @file install.sh                |
# | @author 沈煜, shenyu@shenyu.me  |
# | @brief 一键部署vim插件和配置    |
# | @date 2015/07/31                |
# +---------------------------------+

set -e

HOME_DIR=~
VIM_CONFIG_REPO=https://github.com/chrisniael/vim-configuration.git
VIM_CONFIG_LOCAL_REPO=$HOME_DIR/.vim-configuration
VIM_CONFIG_FILE=.vimrc
VIM_CONFIG_DIR=.vim
VIM_LOCAL_CONFIG_FILE=$HOME_DIR/$VIM_CONFIG_FILE
VIM_LOCAL_CONFIG_FILE_BACK=$VIM_LOCAL_CONFIG_FILE-backup
VIM_LOCAL_CONFIG_DIR=$HOME_DIR/$VIM_CONFIG_DIR
VIM_LOCAL_CONFIG_DIR_BACK=$VIM_LOCAL_CONFIG_DIR-backup

read -p "Backup old vim config? (y/n, default: y) " backup

# clone/update 配置仓库
if [ -d $VIM_CONFIG_LOCAL_REPO ]
then
	cd $VIM_CONFIG_LOCAL_REPO
	git pull origin master
else
	# clone vim-configuration仓库
	git clone --depth=1 $VIM_CONFIG_REPO $VIM_CONFIG_LOCAL_REPO
fi

# 备份原配置
if [ -f $VIM_LOCAL_CONFIG_FILE ] && [ "$backup" != "n" ]
then
	/bin/mv -f $VIM_LOCAL_CONFIG_FILE $VIM_LOCAL_CONFIG_FILE_BACK
	echo "mv -f $VIM_LOCAL_CONFIG_FILE $VIM_LOCAL_CONFIG_FILE_BACK"
else
    /bin/rm -rf $VIM_LOCAL_CONFIG_FILE
fi

if [ -d $VIM_LOCAL_CONFIG_DIR ] && [ "$backup" != "n" ]
then
	if [ -d $VIM_LOCAL_CONFIG_DIR_BACK ]
	then
		/bin/rm -rf $VIM_LOCAL_CONFIG_DIR_BACK
	fi

	/bin/mv -f $VIM_LOCAL_CONFIG_DIR $VIM_LOCAL_CONFIG_DIR_BACK
	echo "mv -f $VIM_LOCAL_CONFIG_DIR $VIM_LOCAL_CONFIG_DIR_BACK"
else
    /bin/rm -rf $VIM_LOCAL_CONFIG_DIR
fi

/bin/cp -f $VIM_CONFIG_LOCAL_REPO/$VIM_CONFIG_FILE $HOME_DIR/
/bin/cp -r $VIM_CONFIG_LOCAL_REPO/$VIM_CONFIG_DIR $HOME_DIR/

# 安装 Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 安装插件
vim +BundleInstall +qa

# SuperTab 最新版本 2.1 使用起来有点问题
#  * 光标在行首时，按 Tab 键也会出现补全窗口
#  * 与 SnipMate 插件冲突，导致某些功能失效，比如 在某些字符后面不进行补全
# 这里改用 2.0 版本

cd $HOME_DIR/.vim/bundle/supertab
git checkout 2.0

cd $HOME_DIR

/bin/rm -rf $VIM_CONFIG_LOCAL_REPO
