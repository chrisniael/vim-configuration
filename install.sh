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
VIM_CONFIG_DIR_TAR_FILE=.vim.tar.bz2
CTAGS_VERSION=ctags-5.8
CTAGS_TAR_FILE=$CTAGS_VERSION.tar.gz
CTAGS_DOWNLOAD_URL=http://prdownloads.sourceforge.net/ctags/$CTAGS_TAR_FILE
CTAGS_DIR=$CTAGS_VERSION

function install_ctags()
{
	# 安装ctags
	curl -L $CTAGS_DOWNLOAD_URL -o "${CTAGS_TAR_FILE}"
	tar xf $CTAGS_TAR_FILE
	cd $CTAGS_DIR/

	./configure
	make
	sudo make install
}

# clone/update 配置仓库
if [ -d $VIM_CONFIG_LOCAL_REPO ]
then
	cd $VIM_CONFIG_LOCAL_REPO
	git pull origin master
else
	# clone vim-configuration仓库
	git clone --depth=1 $VIM_CONFIG_REPO $VIM_CONFIG_LOCAL_REPO
fi

case $(uname -s) in
	"Linux")
		hash ctags >/dev/null 2>&1 || {
			install_ctags
		}
		;;
	"Darwin")
			install_ctags
		;;
esac

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

/bin/cp -f $VIM_CONFIG_LOCAL_REPO/$VIM_CONFIG_FILE $HOME_DIR/
/bin/cp -rf $VIM_CONFIG_LOCAL_REPO/$VIM_CONFIG_DIR_TAR_FILE $HOME_DIR/

cd $HOME_DIR
tar jxvf $VIM_CONFIG_DIR_TAR_FILE

/bin/rm -f $HOME_DIR/$VIM_CONFIG_DIR_TAR_FILE
/bin/rm -rf $VIM_CONFIG_LOCAL_REPO
