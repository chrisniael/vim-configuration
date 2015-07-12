set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'OmniCppComplete'
Plugin 'SuperTab--Van-Dewoestine'
Plugin 'taglist.vim'
Plugin 'snipMate'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'a.vim'
Plugin 'DoxygenToolkit.vim'
Plugin 'echofunc.vim'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" airline 配置
set t_Co=256       " Explicitly tell Vim that the terminal supports 256 colors
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1			" enable tabline
let g:airline_theme="solarized"
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'

set ambiwidth=double

" DoxygenToolKit 配置
let g:DoxygenToolkit_briefTag_pre="@Brief  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Return   " 
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="沈煜, shenyu@shenyu.me" 

" TagList插件
let Tlist_Auto_Highlight_Tag = 0
let Tlist_Auto_Open=0 " 启动vim 自动打开TagList
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select=0
let Tlist_Compact_Format=1  " 压缩方式
let Tlist_Ctags_Cmd="/usr/local/bin/ctags" 	"指定ctags路径
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column=0 " 不要显示折叠树
let Tlist_Exit_OnlyWindow=1 " 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_File_Fold_Auto_Close=1 "不要关闭其他文件的tags，1让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Max_Submenu_Items=25
let Tlist_Max_Tag_length=20
let Tlist_Process_File_Always=1
let Tlist_Show_Menu=0
let Tlist_Show_One_File=1 " only show tags for current window
let Tlist_Sort_Type="name" " 按名称默认排序
let Tlist_Use_Horiz_Window=0
let Tlist_Use_Right_Window = 0
let Tlist_Use_SingleClick=0
let Tlist_WinHeight=30
let Tlist_WinWidth=40  " taglist窗口宽度
nmap tt :TlistToggle<CR>


" ctags 索引文件 (根据已经生成的索引文件添加)
set tags+=~/.vim/tags/cpp " 增加对C++ STL关键字智能补全的支持
"set tags+=~/.vim/tags/boost "增加对Boost库关键字补全的支持，但是太大，不建议配置


" OmniCppComplete配置:
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif " 自动关闭补全窗口
set completeopt=menuone,menu
"set completeopt=longest,menu

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
let g:rubycomplete_buffer_loading = 1


" SuperTab配置:
"let g:SuperTabLongestHighlight=2 		"选中首选的关键字
let g:SuperTabRetainCompletionType=2 	"记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabDefaultCompletionType="<C-X><C-N><C-P>" 	"默认的执行操作
"let g:SuperTabDefaultCompletionType="context"
"let g:SuperTabContextDefaultCompletionType="<C-N><C-P>"  "对于context的默认的执行操作
let g:SuperTabNoCompleteAfter=['/', '\', ',', '\s', ':', ';', ')', '}', '{', '(', ')', '<', '>']	"在这些字符之后不补全
let g:SuperTabCompletionContexts=['s:ContextText']


" EchoFunc配置
let g:EchoFuncKeyNext='<C-X><C-N>'
let g:EchoFuncKeyPrev='<C-X><C-P>'


" VimMarkDown配置
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1


syntax enable

set number

" 设置Backspace模式
set backspace=indent,eol,start	

let g:solarized_termtrans=1
let g:solarized_menu=0
colorscheme solarized

set foldmethod=syntax
set foldlevel=100	" 启动vim时不自动折叠代码

"帮助显示中文
set helplang=cn

"utf-8编码
set encoding=utf-8

"显示行号
set number

" 自动切换工作路径
"set autochdir 

"记录历史的行数
set history=1000

"背景使用黑色（使用背景黑色后，很多主题颜色会随之改变，不建议设置）
set background=dark

"下面两行在进行编写代码时，在格式对起上很有用；
"第一行，vim使用自动对起，也就是把当前行的对起格式应用到下一行；
"第二行，依据上面的对起格式，智能的选择对起方式，对于类似C语言编
"写上很有用
set autoindent
set smartindent

"第一行设置tab键为4个空格，第二行设置当行之间交错时使用4个空格
set tabstop=4
set shiftwidth=4

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"去除vim的GUI版本中的toolbar
"set guioptions=T

"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set vb t_vb=

"在编辑过程中，在右下角显示光标位置的状态行
set ruler

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车
set incsearch

"查询结果高亮
set hlsearch
