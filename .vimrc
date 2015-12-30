"+------------------------------------------+
"| @file .vimrc                             |
"| @Brief vim配置文件，使用Vundle管理插件   |
"| @author 沈煜, shenyu@shenyu.me           |
"| @date 2015-07-13                         |
"+------------------------------------------+

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'taglist.vim'
Plugin 'OmniCppComplete'
Plugin 'snipMate'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'a.vim'
Plugin 'DoxygenToolkit.vim'
Plugin 'echofunc.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'VimIM'
Plugin 'tpope/vim-dispatch'
Plugin 'mileszs/ack.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"+------------------------------------------+
"| @Brief 插件airline配置                   |
"| @Date 2015-07-13                         |
"+------------------------------------------+
set t_Co=256       " Explicitly tell Vim that the terminal supports 256 colors
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1    " enable tabline
let g:airline#extensions#tabline#buffer_nr_show=1    " 显示buffer行号
let g:airline_theme="solarized"
"set ambiwidth=double    " When iTerm set double-width characters, set it


"+------------------------------------------+
"| @Brief 插件DoxygenToolKit配置            |
"| @Date 2015-07-13                         |
"+------------------------------------------+
"let g:DoxygenToolkit_briefTag_pre="@brief "
"let g:DoxygenToolkit_paramTag_pre="@param "
"let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_versionString="1.0.0"
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="沈煜, shenyu@shenyu.me"

" 新建.h .cpp文件时自动插入作者信息
if has("autocmd")
	au! BufNewFile *.h,*.cpp exec "DoxAuthor"
endif


"+------------------------------------------+
"| @Brief 插件TagList配置，快捷键tt         |
"| @Date 2015-07-13                         |
"+------------------------------------------+
let Tlist_Auto_Highlight_Tag=0
let Tlist_Auto_Open=0 " 启动vim 自动打开TagList
let Tlist_Auto_Update=1
let Tlist_Close_On_Select=0
let Tlist_Compact_Format=1 " 压缩方式
"let Tlist_Ctags_Cmd="/usr/local/bin/ctags" "指定ctags路径
let Tlist_Display_Prototype=0
let Tlist_Display_Tag_Scope=1
let Tlist_Enable_Fold_Column=0 " 不要显示折叠树
let Tlist_Exit_OnlyWindow=1 " 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_File_Fold_Auto_Close=1 "不要关闭其他文件的tags，1让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Max_Submenu_Items=25
let Tlist_Max_Tag_length=20
let Tlist_Process_File_Always=1
let Tlist_Show_Menu=0
let Tlist_Show_One_File=1 " only show tags for current window
let Tlist_Sort_Type="name" " 按名称默认排序
let Tlist_Use_Horiz_Window=0
let Tlist_Use_Right_Window=0
let Tlist_Use_SingleClick=0
let Tlist_WinHeight=30
let Tlist_WinWidth=40  " taglist窗口宽度
nmap tt :TlistToggle<CR>



"+------------------------------------------+
"| @Brief 插件OmniCppComplete配置           |
"| @Date 2015-07-13                         |
"+------------------------------------------+
" ctags 索引文件 (根据已经生成的索引文件添加)
set tags+=~/.vim/tags/cpp " 增加对C++ STL关键字智能补全的支持
"set tags+=~/.vim/tags/boost "增加对Boost库关键字补全的支持，但是太大，不建议配置

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif " 自动关闭补全窗口
set completeopt=menuone,menu    " 可选参数值 longest,menu

let OmniCpp_NamespaceSearch=2
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1         " 总是显示所有成员
let OmniCpp_ShowScopeInAbbr=0
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1 " 显示函数参数列表
let OmniCpp_MayCompleteDot=1      " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow=1    " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope=1    " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD", "__gnu_cxx"]
let OmniCpp_SelectFirstItem=0     " 选中第一个选项但是，不替换
let OmniCpp_LocalSearchDecl=1

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
	\ if &omnifunc == "" |
	\    setlocal omnifunc=syntaxcomplete#Complete |
	\ endif
endif
let g:rubycomplete_buffer_loading=1


"+----------------------------------------------+
"| @Brief 插件SuperTab配置，2.1有bug，检出2.0   |
"| @Date 2015-07-13                             |
"+----------------------------------------------+
"let g:SuperTabLongestHighlight=2    " 选中首选的关键字
let g:SuperTabRetainCompletionType=2    " 记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabDefaultCompletionType="<C-X><C-N><C-P>"    " 默认的执行操作
"let g:SuperTabDefaultCompletionType="context"
"let g:SuperTabContextDefaultCompletionType="<C-N><C-P>"  " 对于context的默认的执行操作
let g:SuperTabNoCompleteAfter=['/', ',', '\s', ':', ';', ')', '}', '{', '(', ')', '<', '>']    " 在这些字符之后不补全
let g:SuperTabCompletionContexts=['s:ContextText']


"+----------------------------------------------+
"| @Brief 插件EchoFunc配置                      |
"| @Date 2015-07-13                             |
"+----------------------------------------------+
let g:EchoFuncLangsUsed=["cpp"]
let g:EchoFuncKeyNext='<C-X><C-N>'
let g:EchoFuncKeyPrev='<C-X><C-P>'


"+----------------------------------------------+
"| @Brief 插件EchoFunc配置                      |
"| @Date 2015-07-13                             |
"+----------------------------------------------+
nmap <silent><C-A> :A<CR>
imap <silent><C-A> <ESC><C-A>
"nmap <silent><C-A><C-A> :AS<CR>
"imap <silent><C-A><C-S> <ESC><C_A><C-S>
nmap <silent><C-A><C-V> :AV<CR>
imap <silent><C-A><C-V> <ESC><C-A><C-V>


"+----------------------------------------------+
"| @Brief 插件VimMarkDown配置                   |
"| @Date 2015-07-13                             |
"+----------------------------------------------+
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1


"+----------------------------------------------+
"| @Brief 插件VimMarkDown配置                   |
"| @Date 2015-07-13                             |
"+----------------------------------------------+
let g:Vimim_cloud=-1
let g:Vimim_map='tab_as_gi'


"+----------------------------------------------+
"| @Brief 插件ack配置                           |
"| @Date 2015-12-30                             |
"+----------------------------------------------+
let g:ack_default_options=' -s -H --nocolor --nogroup --column --smart-case --follow'
let g:ackhighlight=1
let g:ack_use_dispatch=1


" 语法高亮
syntax enable

" 显示行号
set number

" 设置Backspace模式
set backspace=indent,eol,start

" 设置颜色模式为solarized
let g:solarized_termtrans=1
let g:solarized_menu=0
colorscheme solarized

set foldmethod=syntax
set foldlevel=100    " 启动vim时不自动折叠代码

" 帮助显示中文
set helplang=cn

" utf-8编码
set encoding=utf-8

" 显示行号
set number

" 自动切换工作路径
"set autochdir

" 记录历史的行数
set history=1000

" 背景使用黑色（使用背景黑色后，很多主题颜色会随之改变，不建议设置）
set background=dark

" 下面两行在进行编写代码时，在格式对起上很有用；
" 第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行；
" 第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编
" 写上很有用
set autoindent
set smartindent

" 第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set tabstop=4
set shiftwidth=4

" 设置匹配模式，例如当光标位于一个左括号上时，会高亮相应的那个右括号
set showmatch

" 去除GUI版本中的toolbar
"set guioptions=T

" 关闭错误响声
set vb t_vb=

" 在编辑过程中，在右下角显示光标位置的状态行
set ruler


" 查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
" 个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
" 次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
" 时，别忘记回车
set incsearch

" 高亮查询结果
set hlsearch

" 不产生备份文件
set nobackup

" 输出到终端的编码方式
set termencoding=utf-8

" 缓冲区文本的编码方式
set encoding=utf-8

" 写入文件时采用的编码方式
set fileencoding=utf-8
set fileencodings=utf-8

" 使用的换行符类型
set fileformat=unix
set fileformats=unix

" 重新编辑文件的时，光标定位到最后编辑的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" proto文件高亮
augroup filetype
	au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" F9 高亮光标所在位置的单词，并输入全文替换的命令，替换单词代填充
"nmap <F9> #<S-N>:%s/<C-R>=expand("<cword>")<CR>//g<Left><Left>
"imap <F9> <ESC><F9>

" 在普通模式下使用PageUp和PageDown键翻页，一般这两个键的默认设置就是这样的
"nmap <PAGEUP> <C-B>
"nmap <PAGEDOWN> <C-F>

" 在编辑模式下，使用Ctrl+E和Ctrl+Y移动页面，可以少按两个键（ESC和A）
imap <C-E> <ESC><C-E>a
imap <C-Y> <ESC><C-Y>a

" 自定义命令: Ctags生成tags文件
func! Ctags()
	exec "! ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -o tags"
endfunc

if !exists(':Ctags')
	command! Ctags call Ctags()
endif

if !exists(':W')
	command! W w
endif

if !exists(':Q')
	command! Q q
endif

" 一键编译
func! CompileGcc()
	exec "w"
	let compilecmd="!gcc "
	let compileflag="-o %<.out 2> .%<.err"
	exec compilecmd." % ".compileflag
	exec "cfile .%<.err"
endfunc

func! CompileGpp()
	exec "w"
	let compilecmd="!g++ "
	let compileflag="-o %<.out 2> .%<.err"
	exec compilecmd." % ".compileflag
	exec "cfile .%<.err"
endfunc

func! RunPython()
	exec "w"
	exec "!python %"
endfunc

func! CompileJava()
	exec "w"
	exec "!javac %"
endfunc

func! RunShell()
	exec "w"
	exec "!bash %"
endfunc

func! RunLua()
	exec "w"
	exec "!lua %"
endfunc

func! CompileCode()
	exec "w"
	if &filetype == "cpp"
		exec "call CompileGpp()"
	elseif &filetype == "cc"
		exec "call CompileGpp()"
	elseif &filetype == "c"
		exec "call CompileGcc()"
	elseif &filetype == "python"
		exec "call RunPython()"
	elseif &filetype == "java"
		exec "call CompileJava()"
	elseif &filetype == "sh"
		exec "call RunShell()"
	elseif &filetype == "lua"
		exec "call RunLua()"
	endif
endfunc

func! RunResult()
	exec "w"
	if &filetype == "cpp"
		exec "! ./%<.out"
	elseif &filetype == "cc"
		exec "! ./%<.out"
	elseif &filetype == "c"
		exec "! ./%<.out"
	elseif &filetype == "python"
		exec "call RunPython()"
	elseif &filetype == "java"
		exec "!java %<"
	elseif &filetype == "sh"
		exec "call RunShell()"
	elseif &filetype == "lua"
		exec "call RunLua()"
	endif
endfunc

func! RunResultWithTest()
	exec "w"
	if &filetype == "cpp"
		exec "! ./%<.out < %<.test"
	elseif &filetype == "cc"
		exec "! ./%<.out < %<.test"
	elseif &filetype == "c"
		exec "! ./%<.out < %<.test"
	elseif &filetype == "python"
		exec "call RunPython()"
	elseif &filetype == "java"
		exec "!java %< < %<.test"
	elseif &filetype == "sh"
		exec "call RunShell()"
	elseif &filetype == "lua"
		exec "call RunLua()"
	endif
endfunc

map <C-j> :call CompileCode()<CR>
imap <C-j> <ESC>:call CompileCode()<CR>
vmap <C-j> <ESC>:call CompileCode()<CR>
map <C-k> :call RunResult()<CR>
map <C-l> :call RunResultWithTest()<CR>

map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>
