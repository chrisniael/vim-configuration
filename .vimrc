"+-------------------------------------+
"|vim配置文件                          |
"|主机:ShenYu@Mac OS X                 |
"|时间：2014.08.14                     |
"+-------------------------------------+

"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible

"帮助显示中文
set helplang=cn

"utf-8编码
set encoding=utf-8

"显示行号
set number

"检测文件的类型
filetype on


"智能补全
filetype plugin indent on
"set completeopt=longest,menu

"允许进行文件类型检查 插件 omnicppcomplete
set nocp
filetype plugin on

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"+-------------------------------------+
"|vim配置文件                          |
"|主机: ShenYu@Mac OS X                |
"|时间：2013.06.03                     |
"+-------------------------------------+

set backspace=indent,eol,start

" OmniCppComplete

" ctags 索引文件 (根据已经生成的索引文件添加)
"增加对C++ STL关键字智能补全的支持
set tags+=~/.vim/tags/cpp

" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu

let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1         " 总是显示所有成员
let OmniCpp_ShowScopeInAbbr=0
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1 " 显示函数参数列表
let OmniCpp_MayCompleteDot=1      " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow=1    " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope=1    " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem=2     " 选中第一个选项但是，不替换
let OmniCpp_LocalSearchDecl=0


"let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

"一键生成索引文件"
map <C-h> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
imap <C-h> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
vmap <C-h> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"SuperTab配置
let g:SuperTabLongestHighlight=0 "选中首选的关键字
let g:SuperTabRetainCompletionType=2 "记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabDefaultCompletionType="<C-X><C-N>"
let g:SuperTabNoCompleteAfter=[',', ';', ']', '}', '"', '\s', "'"]

"-------------------------------------------------------------

if has("autocmd") && exists("+omnifunc")
     autocmd Filetype *
    \ if &omnifunc == "" |
    \    setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif
let g:rubycomplete_buffer_loading = 1


"记录历史的行数
set history=1000

"背景使用黑色
set background=dark

"语法高亮度显示
syntax enable
syntax on

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
set guioptions=T

"当vim进行编辑时，如果命令错误，会发出一个响声，该设置去掉响声
set vb t_vb=

"在编辑过程中，在右下角显示光标位置的状态行
set ruler

"默认情况下，寻找匹配是高亮度显示的，该设置关闭高亮显示
"set nohls

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车
set incsearch

"修改一个文件后，自动进行备份，备份的文件名为原文件名加"~"后缀
"if has("vms")     注意双引号要用半角的引号
"set nobackup
"else
"set backup
"endif

"+-----------------------------------------------+
"|插件设置：TagList Ctags WinManager Cscope 等   |
"|主机:ShenYu@Mac OS X                           |
"|最后修改时间： 2014.08.14                      |
"+-----------------------------------------------+

"Taglist 插件
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"文件浏览器和窗口管理器 WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"tags 路径设置
"set tags=/usr/share/vim/vim73/tags

"Php-Doc插件,一键注释
inoremap <C-I> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-I> :call PhpDocSingle()<CR>
vnoremap <C-I> :call PhpDocRange()<CR>

"括号智能匹配
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
"inoremap" <c-r>=QuoteDelim('"')<CR>
"inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endf

function CloseBracket()
if match(getline(line('.') + 1), '\s*}') < 0
return "\<CR>}"
else
return "\<Esc>j0f}a"
endif
endf

function QuoteDelim(char)
let line = getline('.')
let col = col('.')
if line[col - 2] == "\\"
"Inserting a quoted quotation mark into the string
return a:char
elseif line[col - 1] == a:char
"Escaping out of the string
return "\<Right>"
else
"Starting a string
return a:char.a:char."\<Esc>i"
endif
endf
"括号智能匹配 

"一键编译

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
func! RunPython2()
exec "w"
exec "!python2 %"
endfunc
func! CompileJava()
exec "w"
exec "!javac %"
endfunc
func! CompileTex()
exec "w"
exec "!pdflatex %"
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
elseif &filetype == "tex"
exec "call CompileTex()"
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
elseif &filetype == "tex"
exec "!evince %<.pdf"
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
endif
endfunc
map <C-j> :call CompileCode()<CR>
map <C-n> :cnext<CR>  
map <C-p> :cprevious<CR>
imap <C-j> <ESC>:call CompileCode()<CR>
vmap <C-j> <ESC>:call CompileCode()<CR>
map <C-k> :call RunResult()<CR>
map <C-l> :call RunResultWithTest()<CR>
